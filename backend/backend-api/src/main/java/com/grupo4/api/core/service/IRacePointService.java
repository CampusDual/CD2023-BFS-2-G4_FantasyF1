package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface IRacePointService {

    // ---- RACES_POINTS ----

    public EntityResult racePointQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult racePointInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult racePointUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult racePointDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;

}
