package com.infinum.springfield.resilience4j.client.infrastructure.http;

import org.springframework.boot.context.properties.ConfigurationProperties;
import java.net.URI;

@ConfigurationProperties(prefix = "resilience4j.rest-client")
record RestClientProperties(ApiServer apiServer) {

    record ApiServer(int connectTimeoutSeconds, int readTimeoutSeconds, URI baseUri) {
    }

}
