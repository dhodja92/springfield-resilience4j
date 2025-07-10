package com.infinum.springfield.resilience4j.server.infrastructure.persistence.jdbc;

import com.infinum.springfield.resilience4j.server.domain.book.Book;
import com.infinum.springfield.resilience4j.server.domain.book.BookRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.EmptySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import java.time.Duration;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.function.LongSupplier;

@ReadOnlyTransactionalRepository
class BookRepositoryImpl implements BookRepository {

    private static final Random RANDOM = new Random();

    private static final String FIND_BOOK_BY_ID = """
            SELECT id, title, isbn, number_of_pages
            FROM book
            WHERE id = :id""";

    private static final String FIND_ALL_BOOKS = """
            SELECT id, title, isbn, number_of_pages
            FROM book
            OFFSET :offset
            LIMIT :limit""";

    private static final String BOOK_COUNT = """
            SELECT COUNT(*)
            FROM book""";

    private final RowMapper<Book> bookRowMapper = (rs, _) -> new Book(
            rs.getLong("id"),
            rs.getString("title"),
            rs.getString("isbn"),
            rs.getInt("number_of_pages")
    );

    private final NamedParameterJdbcOperations jdbcOperations;

    BookRepositoryImpl(NamedParameterJdbcOperations jdbcOperations) {
        this.jdbcOperations = jdbcOperations;
    }

    @Override
    public Optional<Book> findById(Long id) {
        SqlParameterSource parameterSource = new MapSqlParameterSource("id", id);
        try {
            return Optional.ofNullable(this.jdbcOperations.queryForObject(
                    FIND_BOOK_BY_ID, parameterSource, this.bookRowMapper));
        } catch (EmptyResultDataAccessException _) {
            return Optional.empty();
        }
    }

    @Override
    public Page<Book> findAll(Pageable pageable) {
        SqlParameterSource parameterSource = new MapSqlParameterSource(Map.of(
                "offset", pageable.getOffset(),
                "limit", pageable.getPageSize()
        ));
        List<Book> books = this.jdbcOperations.query(FIND_ALL_BOOKS, parameterSource, this.bookRowMapper);
        LongSupplier bookCountSupplier = () -> this.jdbcOperations.queryForObject(
                BOOK_COUNT, EmptySqlParameterSource.INSTANCE, Long.class);
        return PageableExecutionUtils.getPage(books, pageable, bookCountSupplier);
    }

    @Override
    public Page<Book> findAllWithSimulatedFailures(Pageable pageable) {
        int num = getRandomNumberUsingNextInt(1, 10);
        if (num < 9) {
            throw new RuntimeException("Simulated failure");
        }
        return findAll(pageable);
    }

    @Override
    public Page<Book> findAllWithSimulatedSlowness(Pageable pageable) {
        int num = getRandomNumberUsingNextInt(1, 10);
        if (num < 9) {
            try {
                Thread.sleep(Duration.ofSeconds(10));
            } catch (InterruptedException e) {
                //
            }
        }
        return findAll(pageable);
    }

    private int getRandomNumberUsingNextInt(int min, int max) {
        return RANDOM.nextInt(max - min) + min;
    }

}
