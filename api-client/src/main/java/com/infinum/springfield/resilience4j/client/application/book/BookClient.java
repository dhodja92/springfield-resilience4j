package com.infinum.springfield.resilience4j.client.application.book;

import com.infinum.springfield.resilience4j.client.application.shared.PagedResponse;
import java.util.concurrent.CompletableFuture;

public interface BookClient {

    PagedResponse<BookDto> getBooks(int page, int size);

    CompletableFuture<PagedResponse<BookDto>> getBooksAsync(int page, int size);
}
