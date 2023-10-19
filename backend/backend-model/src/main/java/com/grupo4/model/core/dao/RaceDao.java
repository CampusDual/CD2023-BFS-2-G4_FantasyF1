package com.grupo4.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value ="RaceDao")
@ConfigurationFile(
        configurationFile = "dao/RaceDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class RaceDao extends OntimizeJdbcDaoSupport {
    public static final String RAC_ID = "RAC_ID";
    public static final String RAC_NAME = "RAC_NAME";
    public static final String RAC_CIRCUIT_NAME = "RAC_CIRCUIT_NAME";
    public static final String RAC_CIRCUIT_ID = "RAC_CIRCUIT_ID";
    public static final String RAC_ROUND = "RAC_ROUND";
    public static final String RAC_LOCATION = "RAC_LOCATION";
    public static final String RAC_URL = "RAC_URL";


}
