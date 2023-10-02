package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IUserCompetitionService;
import com.grupo4.model.core.dao.UserCompetitionDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("UserCompetitionService")
public class UserCompetitionService implements IUserCompetitionService {

    @Autowired
    private UserCompetitionDao userCompetitionDao;
    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Override
    public EntityResult userCompetitionQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult userCompetitionInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult userCompetitionUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult userCompetitionDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
