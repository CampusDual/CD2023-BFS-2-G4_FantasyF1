package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IResultService;
import com.grupo4.model.core.dao.ResultDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("ResultService")
public class ResultService implements IResultService {

    @Autowired
    private ResultDao resultDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult resultQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.resultDao, keysValues, attributes);
    }

    @Override
    public EntityResult resultInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.insert(this.resultDao, attributes);
    }

    @Override
    public EntityResult resultUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult resultDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
