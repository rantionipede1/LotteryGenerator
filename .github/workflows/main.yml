package com.company;

import java.util.*;

public class Main {

    public static void main(String[] args) {


        Scanner scan = new Scanner(System.in);
        Scanner scanner = new Scanner(System.in);
        Random rand = new Random();
        int min = 1, max = 49, slots = 6;

        // TO STORE MULTIPLE GAMES
        int[] lotteryArray_auto = new int[slots];
        int[] lotteryArray_auto2 = new int[slots];
        int[] lotteryArray_auto3 = new int[slots];
        int[] lotteryArray_auto4 = new int[slots];
        int[] lotteryArray_auto5 = new int[slots];
        int[] lotteryArray_manual1 = new int[slots];
        int[] lotteryArray_manual2 = new int[slots];
        int[] lotteryArray_manual3 = new int[slots];
        int[] lotteryArray_manual4 = new int[slots];
        int[] lotteryArray_manual5 = new int[slots];
        boolean isRepeated_auto;
        int age;
        int auto_or_manual;
        List<Integer> guessedNumbers = new ArrayList<>();
        List<Integer> winningNumbers = new ArrayList<>();

        do {
            // AGE
            System.out.println("How old are you?");
            age = scan.nextInt();
            if (age >= 18) {


                // NUMBER OF PLAYS
                System.out.println("How many times would you like to play? Maximum is 5");
                int plays = scan.nextInt();
                System.out.println("You would like to play " + plays + " times");

                // AUTO OR MANUAL
                System.out.println("Press 1 for automatically generated numbers");
                System.out.println("Press 2 for manually generated numbers");
                auto_or_manual = scan.nextInt();

                // AUTOMATIC NUMBERS
                if (auto_or_manual == 1)
                    System.out.println("Numbers should display for auto generation");

                    // MANUAL NUMBERS
                else if (auto_or_manual == 2)
                    for (int i = 0; i < 6; i++) {
                        System.out.println("Your current numbers are " + guessedNumbers);
                        System.out.println("Please enter a number between 1 and 49: ");
                        while (true) {
                            try {
                                String numberString = scanner.nextLine();
                                int number = Integer.parseInt(numberString);
                                if (number >= 1 && number <= 49) {
                                    guessedNumbers.add(number);
                                    break;
                                } else {
                                    System.out.println(number + " is not between 1 and 49. Please try again: ");
                                }
                            } catch (NumberFormatException nfe) {
                                System.out.println("Please enter only numbers");
                            }
                        }
                    }
                System.out.println("The winning numbers were: " + winningNumbers);
                System.out.println("Your numbers are: " + guessedNumbers);

                guessedNumbers.retainAll(winningNumbers);
                System.out.println("Your matched numbers are: " + guessedNumbers);

                if (guessedNumbers.containsAll(winningNumbers)) {
                    System.out.println("You're a winner");
                } else {
                    System.out.println("Sorry, you lost.");
                }
                //else
                //   System.out.println("Incorrect entry. Please start over and select 1 or 2");

                break;
            }
            else {
                System.out.println("Sorry you must be 18 to play");
            }

        } while (age >=18);



    }
}
