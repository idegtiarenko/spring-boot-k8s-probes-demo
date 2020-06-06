package com.github.idegtiarenko.probes.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.UUID;

@Entity(name = "users")
public class User {

    @Id
    private UUID id;
    private String name;
}
