package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IUserCompetitionPilotService;
import com.grupo4.model.core.dao.CompetitionDao;
import com.grupo4.model.core.dao.UserCompetitionPilotDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("UserCompetitionPilotService")
public class UserCompetitionPilotService implements IUserCompetitionPilotService {

   @Autowired
    private UserCompetitionPilotDao userCompetitionPilotDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult userCompetitionPilotQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.userCompetitionPilotDao, keysValues, attrMap);
    }

    @Override
    public EntityResult userCompetitionPilotFilterQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.userCompetitionPilotDao, keysValues, attrMap,"filter");
    }

    @Override
    public EntityResult userCompetitionPilotInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.insert(this.userCompetitionPilotDao, attributes);
    }

    @Override
    public EntityResult userCompetitionPilotUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult userCompetitionPilotDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
