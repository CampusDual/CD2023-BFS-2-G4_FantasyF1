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

}
