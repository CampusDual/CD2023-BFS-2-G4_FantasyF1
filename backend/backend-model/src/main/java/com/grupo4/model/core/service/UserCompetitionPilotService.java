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

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

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
        return this.daoHelper.query(this.userCompetitionPilotDao, keysValues, attrMap,"pilotsByCompetition");
    }

    @Override
    public EntityResult userCompetitionIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.userCompetitionPilotDao, keysValues, attrMap,"userCompetitionId");
    }

    @Override
    public EntityResult ownedPilotByCompetitionQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.userCompetitionPilotDao, keysValues, attrMap,"ownedPilotByCompetition");
    }

    @Override
    public EntityResult userCompetitionPilotInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        Integer compId = (Integer) attributes.get(CompetitionDao.COMP_ID);
        Integer ucId = (Integer) attributes.get(UserCompetitionDao.UC_ID);
        Integer pilId = (Integer) attributes.get(PilotDao.PIL_ID);
        Integer pilotPrice = this.getPilotPrice(pilId);
        Integer availableMoney = this.getUserAvailableMoney(ucId);
        LocalDate purchaseDate = LocalDate.now();

        if (this.isPilotAvailable(pilId, compId)){
            if(availableMoney >= pilotPrice){
                availableMoney -= pilotPrice;
                Map<String, Object> attributesToUpdate = new HashMap<>();
                attributesToUpdate.put(UserCompetitionDao.UC_AVAILABLE_MONEY, availableMoney);

                Map<String, Object> keysForUpdate = new HashMap<>();
                keysForUpdate.put(UserCompetitionDao.UC_ID, ucId);
                attributes.put(UserCompetitionPilotDao.UCP_DATE_PURCHASED, purchaseDate);
                attributes.put(UserCompetitionPilotDao.UCP_PRICE_PURCHASED, pilotPrice);
                userCompetitionService.userCompetitionUpdate(attributesToUpdate, keysForUpdate);
                return this.daoHelper.insert(this.userCompetitionPilotDao, attributes);
            } else {
                return null;
            }
        } else {
            EntityResult recordAlreadyExists = new EntityResultMapImpl();
            recordAlreadyExists.setCode(EntityResult.OPERATION_WRONG);
            recordAlreadyExists.setMessage("Record already exists");
            return recordAlreadyExists;
        }
    }

    @Override
    public EntityResult userCompetitionPilotUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        int ucId = (Integer) attributes.get(UserCompetitionDao.UC_ID);
        int pilId = (Integer) attributes.get(PilotDao.PIL_ID);
        int pilotPrice = getPilotPrice(pilId);
        int availableMoney = getUserAvailableMoney(ucId);
        LocalDate sellDate = LocalDate.now();
        availableMoney += pilotPrice;
        Map<String, Object> attributesToUpdate = new HashMap<>();
        attributesToUpdate.put(UserCompetitionDao.UC_AVAILABLE_MONEY, availableMoney);
        Map<String, Object> keysForUpdate = new HashMap<>();
        keysForUpdate.put(UserCompetitionDao.UC_ID, ucId);
        userCompetitionService.userCompetitionUpdate(attributesToUpdate, keysForUpdate);
        attributes.put(UserCompetitionPilotDao.UCP_DATE_SOLD, sellDate);
        attributes.put(UserCompetitionPilotDao.UCP_PRICE_SOLD, pilotPrice);
        return this.daoHelper.update(this.userCompetitionPilotDao, attributes, KeyValues);
    }

    @Override
    public EntityResult userCompetitionPilotDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return this.daoHelper.delete(this.userCompetitionPilotDao, keyValues);
    }

    public int getPilotPrice(int pil_id){
        Map<String, Object> pilIdMap = new HashMap<>();
        pilIdMap.put(PilotDao.PIL_ID, pil_id);
        ArrayList<String> listAttr = new ArrayList<>();
        listAttr.add(PilotDao.PIL_PRICE);
        EntityResult res = this.pilotService.pilotQuery(pilIdMap, listAttr);
        int result = (Integer) res.getRecordValues(0).get(PilotDao.PIL_PRICE);
        return result;
    }

    public int getUserAvailableMoney(int uc_id){
        Map<String, Object> ucIdMap = new HashMap<>();
        ucIdMap.put(UserCompetitionDao.UC_ID, uc_id);
        ArrayList<String> listAttr = new ArrayList<>();
        listAttr.add(UserCompetitionDao.UC_AVAILABLE_MONEY);
        EntityResult res = this.userCompetitionService.userCompetitionQuery(ucIdMap, listAttr);
        int result = (Integer) res.getRecordValues(0).get(UserCompetitionDao.UC_AVAILABLE_MONEY);
        return result;
    }

    public boolean isPilotAvailable(int pilId, int compId){
        ArrayList<String> attrDateSold = new ArrayList<>();
        attrDateSold.add(UserCompetitionPilotDao.UCP_DATE_SOLD);
        Map<String, Object> pilUcIdMap = new HashMap<>();
        pilUcIdMap.put(PilotDao.PIL_ID, pilId);
        pilUcIdMap.put(CompetitionDao.COMP_ID,compId);
        EntityResult ownedPilotRes = ownedPilotByCompetitionQuery(pilUcIdMap, attrDateSold);

        if (ownedPilotRes.calculateRecordNumber() > 0){
            return false;
        }
        return true;
    }

}
