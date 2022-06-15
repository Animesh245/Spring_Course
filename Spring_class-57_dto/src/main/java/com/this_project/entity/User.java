package com.this_project.entity;

import com.this_project.dto.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "users")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name")
    private String userName;

    @Column(name = "email")
    private String userEmail;

    @Column(name = "password")
    private String userPassword;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    private Location location;

    @Enumerated(EnumType.STRING)
    @Column(name = "role")
    private Role role;

//    @ManyToMany(cascade= CascadeType.ALL,fetch=FetchType.EAGER)
//    @JoinTable(name="user_authority",
//            joinColumns = {@JoinColumn(name="id", referencedColumnName="user_id")},
//            inverseJoinColumns = {@JoinColumn(name="id", referencedColumnName="role_id")}
//    )
//    private List<Authority> authorities;


    @OneToOne(fetch = FetchType.LAZY , cascade = CascadeType.ALL)
    @JoinColumn(name = "attachment_id", referencedColumnName = "id")
    private Attachment attachment;

    @OneToMany(orphanRemoval = true, mappedBy = "user")
    private List<Status> statusList;
}
