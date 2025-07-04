package com.infinum.springfield.resilience4j.client.infrastructure.http;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.http.client.ClientHttpRequestFactoryBuilder;
import org.springframework.boot.http.client.ClientHttpRequestFactorySettings;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.web.client.RestClient;
import java.time.Duration;

@Configuration
@EnableConfigurationProperties(RestClientProperties.class)
class RestClientConfig {

    @Bean
    @ApiServerRestClient
    RestClient dataServiceWebClient(RestClient.Builder builder, RestClientProperties properties) {
        ClientHttpRequestFactorySettings settings = ClientHttpRequestFactorySettings
                .defaults()
                .withConnectTimeout(Duration.ofSeconds(properties.apiServer().connectTimeoutSeconds()))
                .withReadTimeout(Duration.ofSeconds(properties.apiServer().readTimeoutSeconds()));
        ClientHttpRequestFactory requestFactory = ClientHttpRequestFactoryBuilder
                .detect()
                .build(settings);
        return builder
                .baseUrl(properties.apiServer().baseUri())
                .requestFactory(requestFactory)
                .build();
        // @formatter:on
    }
}
