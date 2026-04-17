package com.example.exam.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Configuration
@EnableJpaAuditing
public class AuditConfig {
    // This enables the use of @CreatedDate and @LastModifiedDate in entity classes
}
