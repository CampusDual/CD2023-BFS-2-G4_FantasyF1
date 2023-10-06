package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IUserCompetitionService;
import com.grupo4.model.core.dao.UserCompetitionDao;
import com.grupo4.model.core.dao.UserDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import com.ontimize.jee.server.dao.IOntimizeDaoSupport;
import com.ontimize.jee.server.dao.ISQLQueryAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    public EntityResult userCompetitionQuery(Map<String, Object> keysValues, List<String> attrMap) throws OntimizeJEERuntimeException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        keysValues.put(UserDao.ID, authentication.getName());
        return this.daoHelper.query(this.userCompetitionDao, keysValues, attrMap);
    }

    @Override
    public EntityResult userCompetitionInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.insert(userCompetitionDao, attributes);
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
