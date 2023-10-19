package com.grupo4.ws.core.rest;

import com.grupo4.model.core.dao.PilotDao;
import com.grupo4.model.core.service.PilotService;
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
import java.util.HashMap;
import java.util.Map;

@RestController
public class MainRestController {
	@Autowired
	PilotService pilotService;

	@RequestMapping(value = "/main", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public String main() {
		return "index";
	}

	@RequestMapping(value = "/actualizarDatosApi", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public String main2() {
		//getPilots();
		System.out.println("Actualizando datos de la api");
		return "OK";
	}

	public static JSONObject getConection(String direction){
		//Solicitar peticion
		try {
			URL url = new URL(direction);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.connect();

			//Comprobar peticion
			int responseCode = conn.getResponseCode();
			if(responseCode != 200) {
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

	public void getPilots(){
		Map<String, Object> pilotMap = new HashMap<>();
		JSONObject response = getConection("http://ergast.com/api/f1/2023/drivers.json");
		if (response == null){

		}
		JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
		JSONObject jsonObjDriverTable = (JSONObject)(jsonObjMRD.get("DriverTable"));
		JSONArray pilotsArray = new JSONArray(jsonObjDriverTable.get("Drivers").toString());
		for(Object p : pilotsArray){
			JSONObject jobj = (JSONObject) p;
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

	public void getRaces(){
		Map<String, Object> circuitMap = new HashMap<>();
		JSONObject response = getConection("http://ergast.com/api/f1/current.json");
		if (response == null){

		}
		JSONObject jsonObjMRD = (JSONObject) response.get("MRData");
		JSONObject jsonObjRaceTable = (JSONObject)(jsonObjMRD.get("RaceTable"));
		JSONArray racesArray = new JSONArray(jsonObjRaceTable.get("Races").toString());
		for (Object r : racesArray) {
			JSONObject jobj = (JSONObject) r;
			circuitMap.put(RaceDao.RAC_ROUND, jobj.get("round"));
			circuitMap.put(RaceDao.RAC_NAME, jobj.get("raceName"));
			circuitMap.put(RaceDao.RAC_URL, jobj.get("url"));
			JSONObject jsonObjCircuit = (JSONObject) ((JSONObject)r).get("Circuit");
			circuitMap.put(RaceDao.RAC_CIRCUIT_NAME, jsonObjCircuit.get("circuitName"));
			circuitMap.put(RaceDao.RAC_CIRCUIT_ID, jsonObjCircuit.get("circuitId"));
		}
	}

}
