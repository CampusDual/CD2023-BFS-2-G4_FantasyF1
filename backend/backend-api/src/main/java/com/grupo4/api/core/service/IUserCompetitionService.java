package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface IUserCompetitionService {

    // ---- USERS_COMPETITIONS ----

    public EntityResult userCompetitionQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult userCompetitionInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult userCompetitionUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult userCompetitionDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;
    public EntityResult userCompetitionFilterQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;

}
