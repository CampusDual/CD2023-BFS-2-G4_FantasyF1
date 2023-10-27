package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IRacePointService;
import com.grupo4.model.core.dao.RacePointDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("RacePointService")
public class RacePointService implements IRacePointService {

    @Autowired
    private RacePointDao racePointDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult racePointQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.racePointDao, keysValues, attributes);
    }

    @Override
    public EntityResult racePointInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.insert(this.racePointDao, attributes);
    }

    @Override
    public EntityResult racePointUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult racePointDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
