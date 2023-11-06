package com.grupo4.api.core.service;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public interface ICompetitionService {

    // ---- COMPETITION ----

    public EntityResult competitionQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException;
    public EntityResult competitionInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException;
    public EntityResult competitionUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException;
    public EntityResult competitionDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException;
    public EntityResult publicCountCompetitionQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult competitionByIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult availableMoneyFilterQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult rankingByIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult rankingByUserAndIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;
    public EntityResult rankingByUserRoundIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException;

}
