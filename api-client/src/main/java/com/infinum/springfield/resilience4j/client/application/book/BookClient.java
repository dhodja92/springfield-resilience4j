package com.infinum.springfield.resilience4j.client.application.book;

import com.infinum.springfield.resilience4j.client.application.shared.PagedResponse;

public interface BookClient {

    PagedResponse<BookDto> getBooks(int page, int size);
}
