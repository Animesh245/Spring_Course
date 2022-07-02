package com.this_project.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = {"com.this_project.service", "com.this_project.config"})
public class SecurityConfig{


    private final PasswordEncoder passwordEncoder;


    private final UserDetailsService userDetailsService;


    public SecurityConfig(PasswordEncoder passwordEncoder, UserDetailsService userDetailsService) {
        this.passwordEncoder = passwordEncoder;
        this.userDetailsService = userDetailsService;
    }


    @Autowired
    public void configure(AuthenticationManagerBuilder managerBuilder) throws Exception {
//        Using userDetailsService to authenticate
        managerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .authorizeHttpRequests()
//                        Permitting all static resources to be accessed publicly
                                        .antMatchers("/images/**", "/css/**", "/js/**", "/vendor/**").permitAll()
//                        Permitting /login and /user type urls to all
                                        .antMatchers("/auth/login/**", "/status/list", "/user/create", "/status/card-view").permitAll()
//                        /location/** type url can be accessed only if client's role is ADMIN
                                        .antMatchers("/location/create","/status/delete/**", "/user/delete/**").hasAuthority("ROLE_ADMIN")
                                .antMatchers("/location/list").hasAnyRole("USER","ADMIN")
                                .antMatchers("/status/create","/status/update/**","/status/delete/**", "/user/update/**").hasRole("USER")
//                        Other than above-mentioned urls no request will be allowed access
                                .anyRequest().authenticated()

                .and()
//              Configuring form login page
                .formLogin()
//                This is the landing page url
                .loginPage("/auth/login")
//                Login post action url
                .loginProcessingUrl("/login-processing")
//                Permitting all to the login page
                .permitAll()
//               jsp page input name tag values should match with this
                .usernameParameter("email")
                .passwordParameter("password")
//                landing page after successful login
                .defaultSuccessUrl("/status/card-view")
//                  Endpoint to hit for failed login
                .failureUrl("/auth/login?error=true")
                .and()
                .logout()
                .logoutUrl("/auth/logout")
                .logoutSuccessUrl("/").permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/auth/403");

                return http.build();

    }
}