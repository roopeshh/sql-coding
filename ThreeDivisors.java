
/**
    Given 2 natural numbers a and b (a < b) with at most 9 digits each.
    Show how many numbers in the range [a, b] have exactly 3 divisors.
    Example: In the range [11,50] the numbers that have exactly 3 divisors are 25 and 49, so 2 will be displayed.
 **/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ThreeDivisors {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        int a = Integer.parseInt(bufferedReader.readLine());
        int b = Integer.parseInt(bufferedReader.readLine());
        int result = getNumberOf3DivisorsBetween(a,b);
        System.out.println(result);
    }

    public static int getNumberOf3DivisorsBetween(int a, int b) {
        int countOfDivisors = 0;
        for (int i =a;i<=b;i++){
            if(isPerfectSquare(i)) {
                double squareRoot = Math.sqrt(i);
                if(isPrime((int) squareRoot)) {
                    countOfDivisors++;
                }
            }
        }
        return countOfDivisors;
    }

    public static boolean isPerfectSquare(int number){
        if(number>0){
            double squareRoot = Math.sqrt(number);
            return ((squareRoot- Math.floor(squareRoot)) == 0);
        }
        return false;
    }

    public static boolean isPrime(int number){
        if (number <= 1)
            return false;
        else if (number == 2)
            return true;
        else if (number % 2 == 0)
            return false;
        for (int i = 3; i <= Math.sqrt(number); i += 2)
        {
            if (number % i == 0)
                return false;
        }
        return true;
    }
}
