package com.infinum.springfield.resilience4j.client.infrastructure.http;

import com.infinum.springfield.resilience4j.client.application.book.BookClient;
import com.infinum.springfield.resilience4j.client.application.book.BookDto;
import com.infinum.springfield.resilience4j.client.application.shared.PagedResponse;
import io.github.resilience4j.bulkhead.annotation.Bulkhead;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.retry.annotation.Retry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;
import java.util.List;

@Component
class BookRestClient implements BookClient {

    private static final Logger log = LoggerFactory.getLogger(BookRestClient.class);

    private static final String API_SERVER = "ApiServer";

    private static final ParameterizedTypeReference<PagedResponse<BookDto>> BOOKS_LIST_TYPE =
            new ParameterizedTypeReference<>() {};

    private final RestClient restClient;

    BookRestClient(@ApiServerRestClient RestClient restClient) {
        this.restClient = restClient;
    }

    @Retry(name = API_SERVER, fallbackMethod = "fallbackGetBooks")
    @CircuitBreaker(name = API_SERVER)
    @Bulkhead(name = API_SERVER)
    @Override
    public PagedResponse<BookDto> getBooks(int page, int size) {
        return this.restClient.get()
                .uri("/books?page={page}&size={size}", page, size)
                .retrieve()
                .body(BOOKS_LIST_TYPE);
    }

    private PagedResponse<BookDto> fallbackGetBooks(int page, int size, Exception ex) {
        log.warn("Error executing HTTP request, recovering by returning null, error: {}", ex.getMessage());
        return new PagedResponse<>(List.of(), PagedResponse.PageMetadata.empty());
    }

}
