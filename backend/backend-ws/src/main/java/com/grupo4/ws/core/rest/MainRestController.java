package com.grupo4.ws.core.rest;

import com.grupo4.model.core.dao.*;
import com.grupo4.model.core.service.*;
import com.ontimize.jee.common.dto.EntityResult;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@RestController
public class MainRestController {
    @Autowired
    PilotService pilotService;

    @Autowired
    RaceService raceService;

    @Autowired
    ResultService resultService;

    @Autowired
    RacePointService racePointService;

    @Autowired
    UserCompetitionPilotService userCompetitionPilotService;

    @Autowired
    PilotPriceService pilotPriceService;

    ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

    private int round = 1;

    private final int LAST_ROUND = 23;

    @RequestMapping(value = "/main", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String main() {
        return "index";
    }

    @RequestMapping(value = "/actualizarDatosApi", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateAPI() {
        //getPilots();
        //getRaces();
        //this.getResults(17);
        //System.out.println("Actualizando datos de la api");
        //this.getRoundClasification(1);
        //this.getGeneralClasificationPerRound(5);
        scheduler.scheduleAtFixedRate(() -> loadRaces(), 0, 1, TimeUnit.SECONDS);
        return "OK";
    }

    private void loadRaces() {
        if(this.round <= this.LAST_ROUND){
            System.out.println("Cargando datos de la carrera " + this.round);
            //this.getResults(this.round);
            this.round++;
        } else {
            scheduler.shutdown();
            System.out.println("Finalizan las carreras");
        }
    }

    public static JSONObject getConnection(String direction) {
        //Solicitar peticion
        try {
            URL url = new URL(direction);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            //Comprobar peticion
            int responseCode = conn.getResponseCode();
            if (responseCode != 200) {
                System.out.println("Algo ha ido mal. Codigo: " + responseCode);
            } else {
                InputStream strm = conn.getInputStream();
                byte[] arrStream = strm.readAllBytes();
                String cntJson = new String(arrStream, StandardCharsets.UTF_8);
                JSONObject jsonObj = new JSONObject(cntJson);
                return jsonObj;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void getPilots() {
        Map<String, Object> pilotMap = new HashMap<>();
        JSONObject response = getConnection("http://ergast.com/api/f1/2023/drivers.json");
        if (response != null) {
            JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
            JSONObject jsonObjDriverTable = (JSONObject) (jsonObjMRD.get("DriverTable"));
            JSONArray pilotsArray = new JSONArray(jsonObjDriverTable.get("Drivers").toString()); //TODO eliminar toString
            for (Object p : pilotsArray) {
                JSONObject jobj = (JSONObject) p;
                String st1 = jobj.get("driverId").toString();
                if (existsPilot(st1)){
                    System.out.println("Piloto repetido");
                } else {
                    pilotMap.put(PilotDao.PIL_DRIVER_ID, jobj.get("driverId"));
                    pilotMap.put(PilotDao.PIL_NAME, jobj.get("givenName"));
                    pilotMap.put(PilotDao.PIL_SURNAME, jobj.get("familyName"));
                    pilotMap.put(PilotDao.PIL_NATIONALITY, jobj.get("nationality"));
                    pilotMap.put(PilotDao.PIL_BIRTHDAY, jobj.get("dateOfBirth"));
                    pilotMap.put(PilotDao.PIL_URL, jobj.get("url"));
                    pilotMap.put(PilotDao.PIL_NUMBER, jobj.get("permanentNumber"));
                    this.pilotService.pilotInsert(pilotMap);
                }
            }
        } else {
            System.out.println("No se han obtenido resultados");
        }
    }

    public void getRaces() {
        JSONObject response = getConnection("http://ergast.com/api/f1/current.json");
        if (response != null) {
            JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
            JSONObject jsonObjRaceTable = (JSONObject) (jsonObjMRD.get("RaceTable"));
            JSONArray racesArray = new JSONArray(jsonObjRaceTable.get("Races").toString());
            for (Object r : racesArray) {
                JSONObject jobjRaces = (JSONObject) r;
                JSONObject jsonObjCircuit = (JSONObject)jobjRaces.get("Circuit");
                String st1 = jsonObjCircuit.get("circuitId").toString();
                if (existsCircuit(st1)){
                    System.out.println("Circuito repetido");
                } else {
                    Map<String, Object> raceMap = new HashMap<>();
                    raceMap.put(RaceDao.RAC_ROUND, jobjRaces.get("round"));
                    raceMap.put(RaceDao.RAC_NAME, jobjRaces.get("raceName"));
                    raceMap.put(RaceDao.RAC_URL, jobjRaces.get("url"));
                    raceMap.put(RaceDao.RAC_CIRCUIT_NAME, jsonObjCircuit.get("circuitName"));
                    raceMap.put(RaceDao.RAC_CIRCUIT_ID, jsonObjCircuit.get("circuitId"));
                    JSONObject jsonLocation = (JSONObject) (jsonObjCircuit.get("Location"));
                    raceMap.put(RaceDao.RAC_LOCALITY, jsonLocation.get("locality"));
                    raceMap.put(RaceDao.RAC_COUNTRY, jsonLocation.get("country"));
                    raceMap.put(RaceDao.RAC_DATE, jobjRaces.get("date"));
                    this.raceService.raceInsert(raceMap);
                }
            }
        } else {
            System.out.println("No se ha obtenido ningun resultado");
        }
    }

    public void updatePilotPrice() {
        Map<String, Object> classificationChampionship = new HashMap<>();
        Map<String, Object> pricePilot = new HashMap<>();
        //int[] ArrayPrices = [12,656];
        JSONObject response = getConnection("http://ergast.com/api/f1/current/driverStandings.json");
        if (response != null) {
            JSONObject jsonObj2 = (JSONObject) response.get("MRData");
            JSONObject jsonObj3 = (JSONObject) (jsonObj2.get("StandingsTable"));
            JSONArray standingsLists = new JSONArray(jsonObj3.get("StandingsLists").toString());
            for (Object obj : standingsLists) {
                JSONObject jobj = (JSONObject) obj;
                JSONArray driverStandings = new JSONArray(jobj.get("StandingsLists").toString());
                for (Object obj2 : driverStandings) {
                    JSONObject driver = (JSONObject) obj2;
                    //pricePilot.put(PilotDao.PIL_PRICE, );
                }
            }
        }
    }

    public void getResults(int round){
        JSONObject response = getConnection("http://ergast.com/api/f1/2023/" + round + "/results.json");
        List<String> attrPilId = List.of(PilotDao.PIL_ID);
        List<String> attrRacId = List.of(RaceDao.RAC_ID);
        List<String> attrUcpId = List.of(UserCompetitionPilotDao.UCP_ID);
        List<String> attrDateSold = List.of(UserCompetitionPilotDao.UCP_DATE_SOLD);
        List<String> attrResId = List.of(ResultDao.RES_ID);
        if (response != null){
            JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
            JSONObject jsonObjRaceT = (JSONObject)(jsonObjMRD.get("RaceTable"));
            JSONArray races = new JSONArray(jsonObjRaceT.get("Races").toString());
            for (Object r: races){
                JSONObject objRaces = (JSONObject) r;
                JSONObject jsonCircuit = (JSONObject) (objRaces.get("Circuit"));
                JSONArray racesResults = new JSONArray(objRaces.get("Results").toString());
                String st1 = jsonCircuit.get("circuitId").toString();
                if (existsResult(st1)) {
                    System.out.println("Resultado repetido");
                } else {
                    for (Object result: racesResults) {
                        Map<String, Object> resultsMap = new HashMap<>();
                        Map<String, Object> idPilotMap = new HashMap<>();
                        Map<String, Object> idCircuitMap = new HashMap<>();
                        Map<String, Object> racePointPilotMap = new HashMap<>();
                        Map<String, Object> racePilotId = new HashMap<>();
                        JSONObject resultObject = (JSONObject) result;
                        JSONObject driver = (JSONObject) resultObject.get("Driver");
                        resultsMap.put(ResultDao.RES_POSITION, resultObject.get("position"));

                        //Se checkea el position text para modificarlo por DNF o DNS
                        String position = resultObject.get("positionText").toString();
                        String positionChanged =  this.changePositionText(position);
                        resultsMap.put(ResultDao.RES_POSITION_TEXT, positionChanged);

                        //Se checkea el position text para variar la puntuacion en caso de ser R o W
                        String positionText = resultObject.get("positionText").toString();
                        int points = 0;
                        if(positionText.equals("R")){
                            points = -2;
                        } else if(positionText.equals("W")){
                            points = -5;
                        } else {
                            points = Integer.parseInt(resultObject.get("points").toString());
                        }
                        resultsMap.put(ResultDao.RES_POINTS, points);

                        //Recogemos PIL_ID
                        idPilotMap.put(PilotDao.PIL_DRIVER_ID, driver.get("driverId"));
                        EntityResult resPilot = this.pilotService.pilotQuery(idPilotMap, attrPilId);
                        resultsMap.put(PilotDao.PIL_ID, resPilot.get(PilotDao.PIL_ID));

                        //Recogemos RAC_ID
                        idCircuitMap.put(RaceDao.RAC_CIRCUIT_ID, jsonCircuit.get("circuitId"));
                        EntityResult resRace = this.raceService.raceQuery(idCircuitMap, attrRacId);
                        resultsMap.put(RaceDao.RAC_ID, resRace.get(RaceDao.RAC_ID));
                        this.resultService.resultInsert(resultsMap);

                        //----------- Añadiendo puntuaciones a usuarios ------------//
                        //Recogemos UCP_ID
                        racePointPilotMap.put(PilotDao.PIL_ID, resPilot.getRecordValues(0).get(PilotDao.PIL_ID));
                        EntityResult resUcpId = this.userCompetitionPilotService.userCompetitionPilotQuery(racePointPilotMap, attrUcpId);

                        EntityResult resDateSold = this.userCompetitionPilotService.userCompetitionPilotQuery(racePointPilotMap, attrDateSold);
                        racePilotId.put(RaceDao.RAC_ID, resRace.getRecordValues(0).get(RaceDao.RAC_ID));
                        racePilotId.put(PilotDao.PIL_ID, resPilot.getRecordValues(0).get(PilotDao.PIL_ID));
                        EntityResult resId = resultService.resultQuery(racePilotId, attrResId);

                        for (int i = 0; i < resUcpId.calculateRecordNumber(); i++) {
                            if (resDateSold.getRecordValues(i).get(UserCompetitionPilotDao.UCP_DATE_SOLD) == null){
                                Map<String, Object> racePointMap = new HashMap<>();
                                racePointMap.put(RacePointDao.RP_POINTS, points);
                                racePointMap.put(UserCompetitionPilotDao.UCP_ID, resUcpId.getRecordValues(i).get(UserCompetitionPilotDao.UCP_ID));
                                racePointMap.put(ResultDao.RES_ID, resId.get(ResultDao.RES_ID));
                                this.racePointService.racePointInsert(racePointMap);
                            }
                        }
                    }
                    this.insertPilotPrice(round);
                    System.out.println("Se insertan los datos");
                }
            }

        } else {
            System.out.println("No se han obtenido resultados");
        }
    }

    public void getRoundClasification(int round){
        int correction = 88 + round;
        Map<String, Object> map = new HashMap<>();
        for(int i = 0; i < round; i++){
            map.put(RaceDao.RAC_ID, correction + i);
            List<String> attributes = List.of(PilotDao.PIL_ID,
                                            PilotDao.PIL_SURNAME,
                                            ResultDao.RES_POINTS,
                                            ResultDao.RES_POSITION,
                                            ResultDao.RES_POSITION_TEXT);
            EntityResult clasification = this.resultService.roundClasificationQuery(map, attributes);
            System.out.println("Clasificacion");
            System.out.println(clasification);
            for(int k = 0; k < clasification.calculateRecordNumber(); k++){
                System.out.println("ID: " +  clasification.getRecordValues(k).get(PilotDao.PIL_ID));
                System.out.println("Pilot: " + clasification.getRecordValues(k).get(PilotDao.PIL_SURNAME));
                System.out.println("Points: " + clasification.getRecordValues(k).get(ResultDao.RES_POINTS));
                System.out.println("Position: " + clasification.getRecordValues(k).get(ResultDao.RES_POSITION));
                System.out.println("State: " + clasification.getRecordValues(k).get(ResultDao.RES_POSITION_TEXT));
            }
        }
    }

    public void insertPilotPrice(int round){
        List<Integer> arrayPricesStandings = List.of(130000,100000,90000,90000, 80000,80000, 70000,70000, 60000,60000, 50000,50000,
                40000,40000, 30000,30000,20000,20000,10000,10000,0,0);
        int correction = 88 + round;
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> mapPilotPriceToInsert = new HashMap<>();

        //Se hace la query para saber los resultados de la ronda
        map.put(RaceDao.RAC_ID, correction);
        List<String> attributes = List.of(PilotDao.PIL_ID,
                PilotDao.PIL_SURNAME,
                ResultDao.RES_POINTS,
                ResultDao.RES_POSITION,
                RaceDao.RAC_ID);
        EntityResult clasification = this.resultService.roundClasificationQuery(map, attributes);
        for(int j = 0; j < clasification.calculateRecordNumber(); j++){

            //Se recupera el valor que tiene el piloto
            int pp_former_price = getPilotPrice(clasification, j);

            //Se introducen los datos en pilots_prices
            int pp_new_price = arrayPricesStandings.get(j);
            int pil_id = (int) clasification.getRecordValues(j).get(PilotDao.PIL_ID);
            int rac_id = (int) clasification.getRecordValues(j).get(RaceDao.RAC_ID);

            mapPilotPriceToInsert.put(PilotPriceDao.PP_FORMER_PRICE, pp_former_price);
            mapPilotPriceToInsert.put(PilotPriceDao.PP_NEW_PRICE, pp_new_price);
            mapPilotPriceToInsert.put(PilotDao.PIL_ID, pil_id);
            mapPilotPriceToInsert.put(RaceDao.RAC_ID, rac_id);

            //Se hace el insert
            this.pilotPriceService.pilotPriceInsert(mapPilotPriceToInsert);

            //Se hace un update de la tabla pilotos
            Map<String, Object> mapPilotUpdate = Map.of(PilotDao.PIL_PRICE, pp_new_price);
            Map<String, Object> attributesPilotUpdate = Map.of(PilotDao.PIL_ID, pil_id);
            this.pilotService.pilotUpdate(mapPilotUpdate, attributesPilotUpdate);
        }

    }

    public int getPilotPrice(EntityResult result, int position){
        Map<String, Object> mapPilotPrice = new HashMap<>();
        mapPilotPrice.put(PilotDao.PIL_ID, result.getRecordValues(position).get(PilotDao.PIL_ID));
        List<String> pilId = List.of(PilotDao.PIL_PRICE);
        EntityResult pilotPrices = this.pilotService.pilotQuery(mapPilotPrice, pilId);
        return (int)pilotPrices.getRecordValues(0).get(PilotDao.PIL_PRICE);
    }

    public void getGeneralClasificationPerRound(int round){
        JSONObject response = getConnection("http://ergast.com/api/f1/2023/" + round + "/driverStandings.json");
        if (response != null) {
            JSONObject jsonObjMRData = (JSONObject) response.get("MRData");
            JSONObject jsonObjST = (JSONObject) (jsonObjMRData.get("StandingsTable"));
            JSONArray standingsLists = new JSONArray(jsonObjST.get("StandingsLists").toString());
            for (Object objectSL : standingsLists) {
                JSONObject jsonObjDS = (JSONObject) objectSL;
                JSONArray driverStandings = new JSONArray(jsonObjDS.get("DriverStandings").toString());
                for (Object obj : driverStandings) {
                    JSONObject resultObject = (JSONObject) obj;
                    System.out.println("Position: " + resultObject.get("position"));
                    System.out.println("PositionText: " + resultObject.get("positionText"));
                    System.out.println("Points: " + resultObject.get("points"));
                    JSONObject driver = (JSONObject) resultObject.get("Driver");
                    System.out.println("Driver: " + driver.get("familyName"));
                }
            }
        }
    }

    public boolean existsPilot(String driverIdParam){
        Map<String, Object> mapParam = new HashMap<>();
        mapParam.put(PilotDao.PIL_DRIVER_ID, driverIdParam);
        ArrayList<String> attrPilot = new ArrayList<>();
        attrPilot.add(PilotDao.PIL_DRIVER_ID);
        EntityResult result =  this.pilotService.pilotQuery(mapParam, attrPilot);
        return !result.isEmpty();
    }

    public boolean existsCircuit(String circuitIdParam){
        Map<String, Object> mapParam = new HashMap<>();
        mapParam.put(RaceDao.RAC_CIRCUIT_ID, circuitIdParam);
        ArrayList<String> attrRace = new ArrayList<>();
        attrRace.add(RaceDao.RAC_CIRCUIT_ID);
        EntityResult result =  this.raceService.raceQuery(mapParam, attrRace);
        return !result.isEmpty();
    }

    public boolean existsResult(String resultIdParam){
        Map<String, Object> mapParamRace = new HashMap<>();
        mapParamRace.put(RaceDao.RAC_CIRCUIT_ID, resultIdParam);
        ArrayList<String> attrRace = new ArrayList<>();
        ArrayList<String> attrResult = new ArrayList<>();
        attrRace.add(RaceDao.RAC_ID);
        EntityResult resultRaceID =  this.raceService.raceQuery(mapParamRace, attrRace);
        attrResult.add(ResultDao.RES_ID);
        EntityResult result = this.resultService.resultQuery(resultRaceID.getRecordValues(0), attrResult);
        return !result.isEmpty();
    }

    public String changePositionText(String position){
        String positionChanged = "";
        if(position.equals("R")){
            positionChanged = "DNF";
        } else if(position.equals("W")){
            positionChanged = "DNS";
        } else {
            positionChanged = position;
        }
        return positionChanged;
    }


}
