package com.grupo4.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value ="PilotDao")
@ConfigurationFile(
        configurationFile = "dao/PilotDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class PilotDao extends OntimizeJdbcDaoSupport {
    public static final String IDPILOT = "IDPILOT";
    public static final String NAME = "NAME";
    public static final String SURNAME = "SURNAME";
    public static final String TEAM = "TEAM";
}
