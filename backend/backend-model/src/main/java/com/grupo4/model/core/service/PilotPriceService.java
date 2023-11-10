package com.grupo4.model.core.service;

import com.grupo4.api.core.service.IPilotPriceService;
import com.grupo4.model.core.dao.PilotPriceDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Lazy
@Service("PilotPriceService")
public class PilotPriceService implements IPilotPriceService {

    @Autowired
    private PilotPriceDao pilotPriceDao;

    @Autowired
    private DefaultOntimizeDaoHelper DaoHelper;

    @Override
    public EntityResult pilotPriceQuery(Map<String, Object> keysValues, List<String> attributes) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult pilotPriceInsert(Map<String, Object> attributes) throws OntimizeJEERuntimeException {



        return null;
    }

    @Override
    public EntityResult pilotPriceUpdate(Map<String, Object> attributes, Map<String, Object> KeyValues) throws OntimizeJEERuntimeException {
        return null;
    }

    @Override
    public EntityResult pilotPriceDelete(Map<String, Object> keyValues) throws OntimizeJEERuntimeException {
        return null;
    }
}
