package com.infinum.springfield.resilience4j.server.domain.book;

public record Book(long id, String title, String isbn, int numberOfPages) {
}
