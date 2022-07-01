package com.this_project.config;

import com.this_project.config.security.SecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.DispatcherServlet;


import javax.servlet.*;

public class AppInitializer implements WebApplicationInitializer {


    @Override
    public void onStartup(ServletContext servletContext) {

//        Root Config
        AnnotationConfigWebApplicationContext rootConfig = new AnnotationConfigWebApplicationContext();
        rootConfig.register(RootConfig.class, DbConfig.class, SecurityConfig.class);
        rootConfig.refresh();
        servletContext.addListener(new ContextLoaderListener(rootConfig));

//        Servlet Config
        AnnotationConfigWebApplicationContext servletConfig = new AnnotationConfigWebApplicationContext();
        servletConfig.register(ServletConfig.class);
        ServletRegistration.Dynamic servletRegistration = servletContext.addServlet("servlet", new DispatcherServlet(servletConfig));

        // Multipart Config
        MultipartConfigElement multipartConfigElement = new MultipartConfigElement(Properties.TMP_FOLDER, Properties.MAX_UPLOAD_SIZE, Properties.MAX_UPLOAD_SIZE * 5, 0);
        servletRegistration.setMultipartConfig(multipartConfigElement);

        FilterRegistration.Dynamic multipartFilter = servletContext.addFilter("multipartFilter", MultipartFilter.class);
        multipartFilter.addMappingForUrlPatterns(null, true, "/*");

        // Load on StartUp
        servletRegistration.setLoadOnStartup(1);

        // mapping
        servletRegistration.addMapping("/");
    }
}
