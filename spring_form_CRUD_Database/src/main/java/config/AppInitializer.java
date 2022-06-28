package config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;
import java.io.File;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{RootConfig.class, DbConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] {ServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration){
//        upload tmp file will put here
//        File uploadDirectory = new File()

        MultipartConfigElement multipartConfigElement = new MultipartConfigElement(Properties.TMP_FOLDER, Properties.MAX_UPLOAD_SIZE, Properties.MAX_UPLOAD_SIZE * 2, Properties.MAX_UPLOAD_SIZE/2);
        registration.setMultipartConfig(multipartConfigElement);
    }
}
