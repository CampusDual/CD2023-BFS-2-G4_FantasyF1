package com.grupo4.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value ="RacePointDao")
@ConfigurationFile(
        configurationFile = "dao/RacePointDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class RacePointDao extends OntimizeJdbcDaoSupport {

    public static final String RP_ID = "RP_ID";
    public static final String RP_POINTS = "RP_POINTS";
    public static final String UCP_ID = "UCP_ID";
    public static final String RAC_ID = "RAC_ID";

}
