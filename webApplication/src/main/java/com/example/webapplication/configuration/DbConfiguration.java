package com.example.webapplication.configuration;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
@EnableConfigurationProperties(DataSourceSettings.class)
public class DbConfiguration {

    @Bean
    @Primary
    public DataSource dataSource(DataSourceSettings settings) {
        HikariConfig cfg = new HikariConfig();
        cfg.setJdbcUrl(settings.getUrl());
        cfg.setUsername(settings.getUsername());
        cfg.setPassword(settings.getPassword());
        if (settings.getDriverClassName() != null) {
            cfg.setDriverClassName(settings.getDriverClassName());
        }
        cfg.setMaximumPoolSize(settings.getMaximumPoolSize());
        cfg.setPoolName("HikariPool");
        return new HikariDataSource(cfg);
    }
}
