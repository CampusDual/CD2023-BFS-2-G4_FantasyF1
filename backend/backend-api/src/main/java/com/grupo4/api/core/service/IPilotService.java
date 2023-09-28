package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface IPilotService {

    // ---- PPILOTS ----

    public EntityResult pilotQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;
    public EntityResult pilotInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult pilotUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult pilotDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;

    // ---- PPILOTS TYPE ----
    public EntityResult pilotTypeQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;
    public EntityResult pilotTypeInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult pilotTypeUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult pilotTypeDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;

}
