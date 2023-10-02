package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IUserCompetitionService;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

import java.util.List;
import java.util.Map;

public class UserCompetitionService implements IUserCompetitionService {
    @Override
    public EntityResult competitionQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult competitionInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult competitionUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult competitionDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
