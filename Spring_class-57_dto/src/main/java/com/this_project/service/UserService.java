package com.this_project.service;

import com.this_project.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
//@Repository
//@Transactional
public class UserService implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        com.this_project.entity.User userFromDb = userDAO.findByEmail(email);
//                .orElseThrow(() -> new UsernameNotFoundException("No user found with this email address."));

        if (userFromDb == null) {
            throw new UsernameNotFoundException(email);
        }

        List<GrantedAuthority> authorities = new ArrayList<>(Collections.emptyList());

        authorities.add((GrantedAuthority) () -> userFromDb.getRole().name());

        return new User(userFromDb.getUserEmail(), userFromDb.getUserPassword(), authorities);
    }
}
