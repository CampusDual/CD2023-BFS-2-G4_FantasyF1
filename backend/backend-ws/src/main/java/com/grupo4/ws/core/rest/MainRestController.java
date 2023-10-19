package com.grupo4.ws.core.rest;

import com.grupo4.model.core.dao.PilotDao;
import com.grupo4.model.core.dao.RaceDao;
import com.grupo4.model.core.dao.ResultDao;
import com.grupo4.model.core.service.PilotService;
import com.grupo4.model.core.service.RaceService;
import com.grupo4.model.core.service.ResultService;
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
import java.util.Map;

@RestController
public class MainRestController {
    @Autowired
    PilotService pilotService;

    @Autowired
    RaceService raceService;

    @Autowired
    ResultService resultService;



    @RequestMapping(value = "/main", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String main() {
        return "index";
    }

    @RequestMapping(value = "/actualizarDatosApi", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String main2() {
        //getPilots();
        getRaces();
        //getResults();
        System.out.println("Actualizando datos de la api");
        return "OK";
    }

    public static JSONObject getConection(String direction) {
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
        JSONObject response = getConection("http://ergast.com/api/f1/2023/drivers.json");
        if (response == null) {

        }
        JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
        JSONObject jsonObjDriverTable = (JSONObject) (jsonObjMRD.get("DriverTable"));
        JSONArray pilotsArray = new JSONArray(jsonObjDriverTable.get("Drivers").toString());
        for (Object p : pilotsArray) {

            JSONObject jobj = (JSONObject) p;

            String st1 = jobj.get("driverId").toString();
            String st2 = getPilDriverId(st1).toString();

            if (st2.contains(st1)){
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
    }

    public void getRaces() {
        Map<String, Object> raceMap = new HashMap<>();
        JSONObject response = getConection("http://ergast.com/api/f1/current.json");
        if (response == null) {

        }
        JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
        JSONObject jsonObjRaceTable = (JSONObject) (jsonObjMRD.get("RaceTable"));
        JSONArray racesArray = new JSONArray(jsonObjRaceTable.get("Races").toString());
        for (Object r : racesArray) {
            JSONObject jobjRaces = (JSONObject) r;
            JSONObject jsonObjCircuit = (JSONObject) ((JSONObject) r).get("Circuit");

            String st1 = jsonObjCircuit.get("circuitId").toString();
            String st2 = getCircuitId(st1).toString();

            if (st2.contains(st1)){
                System.out.println("Circuito repetido");
            } else {
                raceMap.put(RaceDao.RAC_ROUND, jobjRaces.get("round"));
                raceMap.put(RaceDao.RAC_NAME, jobjRaces.get("raceName"));
                raceMap.put(RaceDao.RAC_URL, jobjRaces.get("url"));
                raceMap.put(RaceDao.RAC_CIRCUIT_NAME, jsonObjCircuit.get("circuitName"));
                raceMap.put(RaceDao.RAC_CIRCUIT_ID, jsonObjCircuit.get("circuitId"));
                //Pendiente añadir los datos de la localización(lat, long, locality, country)
                //JSONObject jsonLocation = (JSONObject) (jsonObjCircuit.get("Location"));
                //jsonLocation.get("lat");
                this.raceService.raceInsert(raceMap);
            }
        }
    }

    public void updatePilotPrice() {
        Map<String, Object> classificationChampionship = new HashMap<>();
        Map<String, Object> pricePilot = new HashMap<>();
        //int[] ArrarrayPrices = [12,656];
        JSONObject response = getConection("http://ergast.com/api/f1/current/driverStandings.json");
        if (response == null) {

        } else {
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

    public void getResults(){
        Map<String, Object> resultsMap = new HashMap<>();
        ArrayList<String> listAtributesPilot = new ArrayList<>();
        listAtributesPilot.add(PilotDao.PIL_ID);
        ArrayList<String> listAtributesRace = new ArrayList<>();
        listAtributesRace.add(RaceDao.RAC_ID);
        JSONObject response = getConection("http://ergast.com/api/f1/current/last/results.json");
        if (response == null){

        } else {
            JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
            JSONObject jsonObjRaceT = (JSONObject)(jsonObjMRD.get("RaceTable"));
            JSONArray races = new JSONArray(jsonObjRaceT.get("Races").toString());
            for (Object r: races){
                JSONObject objRaces = (JSONObject) r;
                JSONObject jsonCircuit = (JSONObject) (objRaces.get("Circuit"));
                JSONArray racesResults = new JSONArray(objRaces.get("Results").toString());
                for (Object result: racesResults){
                    Map<String, Object> idPilotMap = new HashMap<>();
                    Map<String, Object> idCircuitMap = new HashMap<>();
                    JSONObject resultObject = (JSONObject) result;
                    JSONObject driver = (JSONObject) resultObject.get("Driver");

                    resultsMap.put(ResultDao.RES_POINTS, resultObject.get("points"));
                    resultsMap.put(ResultDao.RES_POSITION, resultObject.get("position"));
                    resultsMap.put(ResultDao.RES_POSITION_TEXT, resultObject.get("positionText"));

                    idPilotMap.put(PilotDao.PIL_DRIVER_ID, driver.get("driverId"));
                    EntityResult resPilot = this.pilotService.pilotQuery(idPilotMap, listAtributesPilot);

                    resultsMap.put(ResultDao.PIL_ID, resPilot.get(PilotDao.PIL_ID));

                    idCircuitMap.put(RaceDao.RAC_CIRCUIT_ID,  jsonCircuit.get("circuitId"));

                    EntityResult resRace =this.raceService.raceQuery(idCircuitMap, listAtributesRace);
                    resultsMap.put(ResultDao.RAC_ID, resRace.get(RaceDao.RAC_ID));

                    this.resultService.resultInsert(resultsMap);
                }
            }
        }
    }

    public Object getPilDriverId(String driverIdParam){
        Map<String, Object> mapParam = new HashMap<>();
        mapParam.put(PilotDao.PIL_DRIVER_ID, driverIdParam);
        ArrayList<String> listAtributesPilot = new ArrayList<>();
        listAtributesPilot.add(PilotDao.PIL_DRIVER_ID);
        EntityResult result =  this.pilotService.pilotQuery(mapParam, listAtributesPilot);
        if (result.isEmpty()){
            return "";
        } else {
            return result.get(PilotDao.PIL_DRIVER_ID);
        }
    }

    public Object getCircuitId(String circuitIdParam){
        Map<String, Object> mapParam = new HashMap<>();
        mapParam.put(RaceDao.RAC_CIRCUIT_ID, circuitIdParam);
        ArrayList<String> listAtributesRace = new ArrayList<>();
        listAtributesRace.add(RaceDao.RAC_CIRCUIT_ID);
        EntityResult result =  this.raceService.raceQuery(mapParam, listAtributesRace);
        if (result.isEmpty()){
            return "";
        } else {
            return result.get(RaceDao.RAC_CIRCUIT_ID);
        }
    }


}
