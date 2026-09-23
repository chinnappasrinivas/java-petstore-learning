package org.openapitools.testng;

import org.testng.Assert;
import org.testng.annotations.Test;

public class CalculatorTest {

    @Test
    public void additionTest() {

        int a = 10;
        int b = 20;

        int result = a + b;

        Assert.assertEquals(result, 30);
    }
}