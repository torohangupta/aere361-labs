/*
AerE 361
Lab 5
Exercise 3
Rohan Gupta
*/

// ------------------------- includes -------------------------
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//  ---------------------- main function ----------------------
void main() {

    // ----------------- predefined variables -----------------
    char word[100];
    char guess[1];
    int wordlen = 0;
    int correctGuesses = 0;
    int gameStatus = 0; // status of the game, 0 if running, 1 if won.

    // ----------------------- run game -----------------------
    printf("Enter word to guess: ");
    fflush(stdout);
    scanf("%s", &word);

    // set initial conditions
    wordlen = strlen(word);
    char maskedWord[wordlen+1];
    for (int i = 0; i < wordlen; i++) {
        maskedWord[i] = '*';
    }
    maskedWord[wordlen] = '\0';
    
    // run game logic
    while (gameStatus == 0) {
        // output/input
        printf("The word is : %s", maskedWord);
        fflush(stdout);
        printf("\nLetter? ");
        scanf(" %c", &guess);
        
        // if the guess is a letter in the word that is not a repeated guess, reveal the letter and iterate the number of correct guesses
        for (int i = 0; i < wordlen; i++) {
            if (guess[0] == word[i] && word[i] != maskedWord[i]) {
                maskedWord[i] = guess[0];
                correctGuesses++;
            }
        }

        // check win condition
        if (correctGuesses == wordlen) {
            printf("Victory! The word is %s!", word);
            gameStatus = 1;
        }
    }
}
