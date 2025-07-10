package com.infinum.springfield.resilience4j.server.domain.book;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.Optional;

public interface BookRepository {

    Optional<Book> findById(Long id);

    Page<Book> findAll(Pageable pageable);

    Page<Book> findAllWithSimulatedFailures(Pageable pageable);

    Page<Book> findAllWithSimulatedSlowness(Pageable pageable);

}
