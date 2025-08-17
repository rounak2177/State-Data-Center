package com.example.MySpringApp;

import com.example.demo.MySpringAppApplication; // Import your main class

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MySpringAppApplication.class); // ✅ Correct class
    }
}
