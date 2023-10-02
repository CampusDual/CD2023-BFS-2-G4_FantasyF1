package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IPilotService;
import com.grupo4.model.core.dao.PilotDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("PilotService")
public class PilotService implements IPilotService {

    @Autowired
    private PilotDao pilotDao;

    @Autowired
    private DefaultOntimizeDaoHelper daoHelper;


    public EntityResult pilotQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return this.daoHelper.query(this.pilotDao, keysValues, attributes);
    }


    public EntityResult pilotInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {
        return null;
    }


    public EntityResult pilotUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }


    public EntityResult pilotDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }

}
