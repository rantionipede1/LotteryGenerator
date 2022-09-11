package com.company;

import java.util.Arrays;
import java.util.Random;  // package to generate random numbers
import java.util.Scanner;

public class AutoGenerate {

    Scanner scan = new Scanner(System.in);
    Random rand = new Random();
    int min = 1, max = 49, slots = 6;
    int[] lotteryArray_auto = new int[slots];
    boolean isRepeated_auto;


            do {
                isRepeated_auto = false;
                // 1 to 49
                int randomNumber_auto = rand.nextInt(max + 1 - min) + min;
                // check for repeated number against
                // the filled non-zero elements
                int numberDrawn_auto = 0;
                for (int z = 0; z <= numberDrawn_auto; z++) {
                    // check against each filled non-zero elements
                    // hope that none repeats the random number
                    //int lotteryArray_auto = 0;
                    if (lotteryArray_auto[z] == randomNumber_auto) {
                        isRepeated_auto = true;
                        break;
                        }
                    }
                } while (isRepeated_auto);
                int numberDrawn_auto = 0;
                int randomNumber_auto = 0;
                lotteryArray_auto[numberDrawn_auto] = randomNumber_auto;

            }
}
