package calculator;

import java.util.*;
import java.util.function.BiFunction;

public class Calculator {
    private final List<Integer> numbers = new LinkedList<>();

    public void enter(int i){
        numbers.add(i);
        if (numbers.size() > 2){
            throw new IllegalStateException();
        }
    }

    private void operate(BiFunction<Integer, Integer, Integer> op) {
        if (numbers.size() != 2) {
            throw new IllegalStateException();
        }
        numbers.set(0, op.apply(numbers.get(0), numbers.get(1)));
        numbers.remove(1);
    }

    public void add(){
        operate(Integer::sum);
    }

    public int getResult(){
        if (numbers.size() != 1){
            throw new IllegalStateException();
        }
        return numbers.get(0);
    }

    public void multiply() {
        operate((a, b) -> a * b);
    }

    public void divide() {
        operate((a, b) -> a / b);
    }

    public void subtract() {
        operate((a, b) -> a - b);
    }
}
