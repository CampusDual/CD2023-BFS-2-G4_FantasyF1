package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface IRaceService {

    // ---- RACES ----

    public EntityResult raceQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;
    public EntityResult raceInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult raceUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult raceDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;


}
