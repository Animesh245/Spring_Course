package com.this_project.entity;

import com.this_project.dto.LocationDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "location")
public class Location implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name")
    private String locationName;

    @OneToMany(orphanRemoval = true,mappedBy = "location", fetch = FetchType.LAZY)
    private List<Status> statusList = new ArrayList<>();

    @OneToMany(orphanRemoval = true, mappedBy = "location" , fetch = FetchType.LAZY)
    private List<User> userList = new ArrayList<>();
}
