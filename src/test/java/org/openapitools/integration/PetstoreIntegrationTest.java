package org.openapitools.integration;

import org.openapitools.OpenApiGeneratorApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.Test;

@SpringBootTest(
    classes = OpenApiGeneratorApplication.class,
    webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT
)
public class PetstoreIntegrationTest extends AbstractTestNGSpringContextTests {

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    public void swaggerApiShouldBeAvailable() {

        ResponseEntity<String> response =
                restTemplate.getForEntity("/v3/api-docs", String.class);

        Assert.assertEquals(response.getStatusCodeValue(), 200);
        Assert.assertNotNull(response.getBody());
    }
}