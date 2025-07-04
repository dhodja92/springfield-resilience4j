package com.infinum.springfield.resilience4j.server.infrastructure.persistence.jdbc;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Repository
@Transactional(readOnly = true)
public @interface ReadOnlyTransactionalRepository {
}
