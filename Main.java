package com.company;

import java.util.Arrays;
import java.util.Random;  // package/class to generate random numbers
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        AutoGenerate autoGenerate = new AutoGenerate();
        ManualGenerate manualGenerate = new ManualGenerate();
        WinningNumberGenerator winningNumberGenerator = new WinningNumberGenerator();
        Scanner scan = new Scanner(System.in);

        System.out.println("Are you over 18? y or n");
        String age = scan.nextLine();
        String lower2 = age.toLowerCase();

        System.out.println("How many times would you like to play? Maximum is 5");
        int plays = scan.nextInt();

        System.out.println("Would you like your numbers automatically generated? y or n");
        String answer = scan.nextLine();
        String lower = answer.toLowerCase();






    }
}
