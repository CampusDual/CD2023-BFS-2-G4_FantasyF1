package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IUserCompetitionPilotService;
import com.grupo4.model.core.dao.CompetitionDao;
import com.grupo4.model.core.dao.PilotDao;
import com.grupo4.model.core.dao.UserCompetitionDao;
import com.grupo4.model.core.dao.UserCompetitionPilotDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;
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
    public EntityResult userCompetitionIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.userCompetitionPilotDao, keysValues, attrMap,"userCompetitionId");
    }

    @Override
    public EntityResult userCompetitionPilotInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        int ucId = (Integer) attributes.get(UserCompetitionDao.UC_ID);
        int availableMoney = (Integer) attributes.get(UserCompetitionDao.UC_AVAILABLE_MONEY);
        int pilotPrice = (Integer) attributes.get(PilotDao.PIL_PRICE);
        ArrayList<String> listAttr = new ArrayList<>();
        listAttr.add(UserCompetitionPilotDao.UC_ID);
        Map<String, Object> mapCompetitionIdQuery = new HashMap<>();
        mapCompetitionIdQuery.put(UserCompetitionPilotDao.PIL_ID,attributes.get(UserCompetitionPilotDao.PIL_ID));
        mapCompetitionIdQuery.put(CompetitionDao.COMP_ID,attributes.get(CompetitionDao.COMP_ID));

        EntityResult resultCompetitionIdQuery = userCompetitionIdQuery(mapCompetitionIdQuery, listAttr);

        if (resultCompetitionIdQuery.isEmpty()){
            if(availableMoney >= pilotPrice){
                availableMoney -= pilotPrice;
                Map<String, Object> attributesToUpdate = new HashMap<>();
                attributesToUpdate.put(UserCompetitionDao.UC_AVAILABLE_MONEY, availableMoney);

                Map<String, Object> keysForUpdate = new HashMap<>();
                keysForUpdate.put(UserCompetitionDao.UC_ID, ucId);

                userCompetitionService.userCompetitionUpdate(attributesToUpdate, keysForUpdate);
                return this.daoHelper.insert(this.userCompetitionPilotDao, attributes);
            } else {
                System.out.println("Not enough money");
                return null;
            }
        } else {
            System.out.println("El registro ya existe, no se inserta nada");
            EntityResult notFound = new EntityResultMapImpl();
            notFound.setCode(EntityResult.OPERATION_WRONG);
            notFound.setMessage("Not Found");
            return notFound;
        }

    }

    @Override
    public EntityResult userCompetitionPilotUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult userCompetitionPilotDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        int ucId = (Integer) keyValues.get(UserCompetitionDao.UC_ID);
        int availableMoney = (Integer) keyValues.get(UserCompetitionDao.UC_AVAILABLE_MONEY);
        int pilotPrice = (Integer) keyValues.get(PilotDao.PIL_PRICE);

        availableMoney += pilotPrice;

        Map<String, Object> attributesToUpdate = new HashMap<>();
        attributesToUpdate.put(UserCompetitionDao.UC_AVAILABLE_MONEY, availableMoney);

        Map<String, Object> keysForUpdate = new HashMap<>();
        keysForUpdate.put(UserCompetitionDao.UC_ID, ucId);

        userCompetitionService.userCompetitionUpdate(attributesToUpdate, keysForUpdate);

        return this.daoHelper.delete(this.userCompetitionPilotDao, keyValues);
    }
}
