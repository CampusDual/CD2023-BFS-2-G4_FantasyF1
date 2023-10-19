package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IRaceService;
import com.grupo4.model.core.dao.RaceDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("RaceService")
public class RaceService implements IRaceService {

    @Autowired
    private RaceDao raceDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    @Override
    public EntityResult raceQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.raceDao, keysValues, attributes);
    }

    @Override
    public EntityResult raceInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.insert(this.raceDao, attributes);
    }

    @Override
    public EntityResult raceUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult raceDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
