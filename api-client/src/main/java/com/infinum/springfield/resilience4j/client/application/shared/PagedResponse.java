package com.infinum.springfield.resilience4j.client.application.shared;

import java.util.List;

public record PagedResponse<T>(List<T> content, PageMetadata page) {

    public record PageMetadata(int size, int number, int totalElements, int totalPages) {

        public static PageMetadata empty() {
            return new PageMetadata(0, 0, 0, 0);
        }
    }
}
