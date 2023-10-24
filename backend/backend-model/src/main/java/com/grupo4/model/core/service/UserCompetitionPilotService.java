package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IUserCompetitionPilotService;
import com.grupo4.model.core.dao.PilotDao;
import com.grupo4.model.core.dao.UserCompetitionDao;
import com.grupo4.model.core.dao.UserCompetitionPilotDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Lazy
@Service("UserCompetitionPilotService")
public class UserCompetitionPilotService implements IUserCompetitionPilotService {

   @Autowired
    private UserCompetitionPilotDao userCompetitionPilotDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Autowired
    private UserCompetitionService userCompetitionService;

    @Autowired
    private PilotService pilotService;

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
        EntityResult res = this.daoHelper.insert(this.userCompetitionPilotDao, attributes);

        Map<String, Object> keyPilot = new HashMap<>();
        List<String> listPilot = new ArrayList<>();
        keyPilot.put(PilotDao.PIL_ID, res.get(UserCompetitionPilotDao.PIL_ID));
        listPilot.add(PilotDao.PIL_PRICE);
        EntityResult resPilot = this.pilotService.pilotQuery(keyPilot, listPilot);
        Integer spentMoney = (Integer) resPilot.getRecordValues(0).get(PilotDao.PIL_PRICE);

        Map<String, Object> keyUserCompetiton = new HashMap<>();
        List<String> listCompetition = new ArrayList<>();
        keyUserCompetiton.put(UserCompetitionDao.UC_ID, res.get(UserCompetitionPilotDao.UC_ID));
        listCompetition.add(UserCompetitionDao.UC_AVAILABLE_MONEY);
        EntityResult resCompetition = this.userCompetitionService.userCompetitionQuery(keyUserCompetiton, listCompetition);

        resCompetition.calculateRecordNumber();
        Integer availableMoney = (Integer) resCompetition.getRecordValues(0).get(UserCompetitionDao.UC_AVAILABLE_MONEY);

        Map<String, Object> attrMap = new HashMap<>();
        attrMap.put(UserCompetitionDao.UC_AVAILABLE_MONEY, (availableMoney-spentMoney));

        return this.userCompetitionService.userCompetitionUpdate(attrMap, keyUserCompetiton);
    }

    @Override
    public EntityResult userCompetitionPilotUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult userCompetitionPilotDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return this.daoHelper.delete(this.userCompetitionPilotDao, keyValues);
    }
}
