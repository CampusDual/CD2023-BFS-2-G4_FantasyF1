package com.grupo4.model.core.service;

import com.grupo4.api.core.service.ICompetitionService;
import com.grupo4.model.core.dao.CompetitionDao;
import com.grupo4.model.core.dao.UserCompetitionDao;
import com.grupo4.model.core.dao.UserDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Lazy
@Service("CompetitionService")
public class CompetitionService implements ICompetitionService {

    @Autowired
    private CompetitionDao competitionDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;

    @Autowired
    private UserCompetitionService userCompetitionService;


    public EntityResult competitionQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.competitionDao, keysValues, attrMap);
    }

    public EntityResult publicCountCompetitionQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.competitionDao, keysValues, attrMap, "publicCount");
    }

    @Override
    public EntityResult competitionByIdQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.competitionDao, keysValues, attrMap, "competitionById");
    }

    public EntityResult competitionInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
        Map<String, Object> keyMap = new HashMap<>();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        keyMap.put(UserDao.ID, authentication.getName());
        EntityResult res = this.daoHelper.insert(competitionDao, attrMap);
        keyMap.put(CompetitionDao.COMP_ID, res.get(CompetitionDao.COMP_ID));
        this.userCompetitionService.userCompetitionInsert(keyMap);
        return res;
    }

    public EntityResult competitionUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.update(competitionDao, attrMap, keyMap);
    }

    public EntityResult competitionDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
        return this.daoHelper.delete(this.competitionDao, keyMap);
    }

}
