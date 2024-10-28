package calculator;

import io.cucumber.java.ParameterType;
import io.cucumber.java.en.*;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Predicate;

import static org.junit.jupiter.api.Assertions.*;

public class CalculatorSteps {
    private final int res = 0;
    private Calculator calculator;

    @Given("I have a Calculator")
    public void iHaveACalculator() {
        this.calculator = new Calculator();
    }

    @When("I {operation} {int} and/by/from {int}")
    public void iWantToPerformAndOperation(String operation, int first, int second) {
        if (operation.equals("subtract")) {
            this.calculator.enter(second);
            this.calculator.enter(first);
            return;
        }
        this.calculator.enter(first);
        this.calculator.enter(second);
    }

    @ParameterType("add|multiply|divide|subtract")
    public String operation(String operation) {
        return operation;
    }

    @Then("the result of the {performedOperation} should be {int}")
    public void theResultShouldBe(Runnable operation, int expectedResult) {
        theResultShouldBeAsExpected(operation, n -> n == expectedResult);
    }

    @Then("the result of the {performedOperation} should be a {expectedInteger} number")
    public void theResultShouldBeAsExpected(Runnable operation, Predicate<Integer> expectation) {
        operation.run();
        assertTrue(expectation.test(this.calculator.getResult()));
    }

    @ParameterType("addition|product|division|subtraction")
    public Runnable performedOperation(String result) {
        final Map<String, Runnable> runnable = new HashMap<>() {{
            put("addition", calculator::add);
            put("product", calculator::multiply);
            put("division", calculator::divide);
            put("subtraction", calculator::subtract);
        }};
        return runnable.get(result);
    }

    @ParameterType("positive|negative|odd|even")
    public Predicate<Integer> expectedInteger(String type) {
        final Map<String, Predicate<Integer>> tests = new HashMap<>() {{
            put("positive", n -> n >= 0);
            put("negative", n -> n < 0);
            put("odd", n -> n % 2 != 0);
            put("even", n -> n % 2 == 0);
        }};
        return tests.get(type);
    }

    @Then("an error should occur")
    public void anErrorShouldOccur() {
        assertThrows(ArithmeticException.class, this.calculator::divide);
    }
}
