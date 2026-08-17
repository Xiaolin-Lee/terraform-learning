package com.example.webapplication.repository;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import java.util.List;

public interface ExampleDao {

    @SqlQuery("SELECT name FROM example")
    List<String> listNames();
}
