package com.grupo4.model.core.dao;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

@Lazy
@Repository(value ="ResultDao")
@ConfigurationFile(
        configurationFile = "dao/ResultDao.xml",
        configurationFilePlaceholder = "dao/placeholders.properties")
public class ResultDao extends OntimizeJdbcDaoSupport {
    public static final String RES_ID = "RES_ID";
    public static final String PIL_ID = "PIL_ID";
    public static final String RAC_ID = "RAC_ID";
    public static final String RES_POINTS = "RES_POINTS";
    public static final String RES_POSITION = "RES_POSITION";
    public static final String RES_POSITION_TEXT = "RES_POSITION_TEXT";

}
