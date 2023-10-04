package com.grupo4.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value ="CompetitionDao")
@ConfigurationFile(
        configurationFile = "dao/CompetitionDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class CompetitionDao extends OntimizeJdbcDaoSupport {
    public static final String COMP_ID = "COMP_ID";
    public static final String COMP_NAME = "COMP_NAME";
    public static final String COMP_ISPUBLIC = "COMP_ISPUBLIC";
    public static final String COMP_DESCRIPTION = "COMP_DESCRIPTION";
    public static final String COMP_CODE = "COMP_CODE";
}
