package com.example.webapplication.model;


public class Users {
    private Long id;
    private String name;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Users(Long uuid, String name) {
        this.id = uuid;
        this.name = name;
    }
}
