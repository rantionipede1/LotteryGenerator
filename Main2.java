package com.company;

import java.util.*;

public class Main2 {

    public static void main(String[] args) {
        int age;
        int auto_or_manual;
        Scanner scan = new Scanner(System.in);

        System.out.println("Welcome to the Lottery!\n");

        do {
            // ASKS USER FOR THEIR AGE
            System.out.println("How old are you?");
            age = scan.nextInt();
            if (age >= 18) {

                // ASKS USER FOR THE NUMBER OF PLAYS THEY DESIRE
                System.out.println("How many times would you like to play? Maximum is 5");
                int plays = scan.nextInt();
                System.out.println("You would like to play " + plays + " times");

                // ASKS USER FOR AUTO-GENERATED OR MANUAL-GENERATED NUMBERS
                System.out.println("Press 1 for automatically generated numbers");
                System.out.println("Press 2 for manually generated numbers");
                auto_or_manual = scan.nextInt();

                // AUTOMATIC NUMBERS PROCESS
                if (auto_or_manual == 1) {
                    winningNumbers();
                    autoGenerate();
                    break;
                }
                // MANUAL NUMBERS PROCESS
                else if (auto_or_manual == 2) {
                    //winningNumbers();
                    manualGenerate();
                    break;
                }
            }
            else {
                System.out.println("Sorry you must be 18 to play");
            }
        } while (age >=18);
    }

    public static void ageLimit() {


    }


    public static void autoGenerate() {
        Random rand = new Random();

        // variables and objects for auto generated numbers
        int min = 1, max = 49, slots = 7;
        int[] lotteryArray = new int[slots];  // array to store the numbers drawn
        int randomNumber = 0;
        boolean isRepeated;  // variable to be used to stop numbers from repeating

        // USER RECEIVES AUTOMATIC NUMBERS
        for (int numberDrawn = 0; numberDrawn < slots; numberDrawn++) {  // for loop to draw numbers
            do {
                isRepeated = false;
                randomNumber = rand.nextInt(max + 1 - min) + min;  // 1 to 49
                for (int k = 0; k <= numberDrawn; k++) {  // for loop to check for repeated numbers
                    // check against each filled non-zero elements
                    // hope that none repeats the random number
                    if (lotteryArray[k] == randomNumber) {
                        isRepeated = true;
                        break;
                    }
                }
            } while (isRepeated);
            lotteryArray[numberDrawn] = randomNumber;
        }
        Arrays.sort(lotteryArray);
        System.out.println("Your auto-generated lottery numbers are: ");
        for (int i = 0; i < slots; i++) {
            System.out.print(lotteryArray[i] + " ");
        }
        System.out.println(" ");
        System.out.println(" ");
        System.out.println("If all numbers match, you're a WINNER!");
        System.out.println(" ");
    }


    public static void manualGenerate() {
        Scanner scanner = new Scanner(System.in);
        Random rand = new Random();

        // variables & objects for manual generated numbers
        List<Integer> guessedNumbers = new ArrayList<>();
        List<Integer> winningNumbers = new ArrayList<>();

        // generates the winning numbers to match with the guessed numbers
        for (int i = 0; i < 7; i++) {
            while (true) {
                int winningNumber = rand.nextInt(49) + 1;
                if (!winningNumbers.contains(winningNumber)) {
                    winningNumbers.add(winningNumber);
                    break;
                }
            }
        }
        // user picks their numbers manually
        System.out.println("Please enter 7 numbers between 1 and 49");
        for (int i = 0; i < 7; i++) {
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
        System.out.println(" ");
        System.out.println("The Maryland Lottery!");
        System.out.println(" ");
        System.out.println("Your numbers are: " + guessedNumbers);
        System.out.println(" ");
        System.out.println("The winning numbers are: ");
        System.out.println(winningNumbers);
        System.out.println(" ");

        guessedNumbers.retainAll(winningNumbers);
        // System.out.println("Your matched numbers are: " + guessedNumbers);

        if (guessedNumbers.containsAll(winningNumbers)) {
            System.out.println("You're a winner");
        } else {
            System.out.println("Sorry, not a winner. Must match all numbers to win.");
        }
    }


    public static void winningNumbers() {
        List<Integer> winningNumbers = new ArrayList<>();
        Random rand = new Random();

        // GENERATES THE WINNING NUMBERS
        for (int i = 0; i < 7; i++) {
            while (true) {
                int winningNumber = rand.nextInt(49) + 1;
                if (!winningNumbers.contains(winningNumber)) {
                    winningNumbers.add(winningNumber);
                    break;
                }
            }
        }
        System.out.println(" ");
        System.out.println("The Maryland Lottery!");
        System.out.println(" ");
        System.out.println("The winning numbers are: " + winningNumbers);
        System.out.println(" ");

    }
}
