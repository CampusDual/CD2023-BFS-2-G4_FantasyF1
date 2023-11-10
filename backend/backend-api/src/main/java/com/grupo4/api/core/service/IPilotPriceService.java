package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface IPilotPriceService {

    // ---- PILOTS_PRICES ----

    public EntityResult pilotPriceQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;
    public EntityResult pilotPriceInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult pilotPriceUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult pilotPriceDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;
    public EntityResult listNamePriceQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;

}
