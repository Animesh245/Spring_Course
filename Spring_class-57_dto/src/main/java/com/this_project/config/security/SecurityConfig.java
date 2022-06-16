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
//if not added componentScan this class is unable to find both the beans.
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

//        http
//                .csrf().disable()
//                .formLogin()
//                .loginPage("/login") // Login page will be accessed through this endpoint. We will create a controller method for this.
//                .loginProcessingUrl("/login-processing") // This endpoint will be mapped internally. This URL will be our Login form post action.
//                .permitAll() // We re permitting all for login page
////                .usernameParameter("username")
////                .passwordParameter("password")
//                .defaultSuccessUrl("/") // If the login is successful, user will be redirected to this URL.
//                .failureUrl("/login?error=true") // If the user fails to login, application will redirect the user to this endpoint
//                .and()
//                .logout()
//                .logoutUrl("/logout")
//                .logoutSuccessUrl("/");

        http
                .authorizeHttpRequests(authz -> authz.anyRequest().authenticated()).httpBasic(withDefaults());
//        http
//                .authorizeRequests(auth -> auth .antMatchers("/resources/**", "/temp/**")
//                        .permitAll()
//                        .antMatchers("/", "/login")
//                        .permitAll()
//                        .anyRequest()
//                        .authenticated() )
//                .formLogin(form -> form .loginPage("/login")
//                        .permitAll()
//                        .usernameParameter("username")
//                        .passwordParameter("password")
//                        .loginProcessingUrl("/login-process")
//                        .defaultSuccessUrl("/")
//                        .permitAll() );


        return http.build();
    }
}

//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//     http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated()).httpBasic(withDefaults());
//     http .authorizeRequests(auth -> auth .antMatchers("/resources/**", "/temp/**")
//                     .permitAll()
//                     .antMatchers("/", "/login")
//                     .permitAll() .anyRequest().authenticated() )
//                     .formLogin(form -> form .loginPage("/login")
//                     .permitAll()
//                     .usernameParameter("username")
//                     .passwordParameter("password")
//                     .loginProcessingUrl("/login-process")
//                     .defaultSuccessUrl("/")
//                     .permitAll() );
//     return http.build(); }
//    }