package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface IResultService {

    // ---- RESULTS ----

    public EntityResult resultQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;
    public EntityResult resultInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult resultUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult resultDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;


}
