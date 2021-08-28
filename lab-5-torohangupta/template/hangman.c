/*
YOUR HEADER INFORMATION
*/
/****************************************************
Write a simple version of hangman, in which the user
enters the word they will "guess", and then the user gets
to start guessing letters. After each guess, the word
is printed out with *s instead of unguessed letters.
 ****************************************************/
#include <stdio.h>
#include <string.h>

/* The following is an outline and is pseudo code
* this will not run, and not all of the syntax is correct.
* But this should get you started.
*/
//MAIN FUNCTION
int main() {

//DEFINE YOUR VARIABLES

  // Get word to guess, store it in answer


  // Set the mask array - mask[i] is true if the
  // character s[i] has been guessed.  The mask
  // must be allocated, and initialized to all false

  int mask[strlen based on input from user];
  //Iterate through mask[i] and set all values to false (zero)


  // Loop over each round of guessing
  int gameover = 0;
  while (! gameover) {
    // Print word with *s for unguessed letters
    printf("The word is : ");
    // Iterate through mask[j]
    for(int j=0; j < N; ++j) {
      //Check for mask[j] for any true conditions, if true,
      // Reveal that character, otherwise print *
      if (mask has true condition in it) {
        //If we have a true condition, print the revealed character

      }
      else {
        //print a * character

      }
    }
    printf("\n");

    // Get player's next guess
    char guess;
    printf("Letter? ");
    fflush(stdout);
    scanf(" %c", &guess);

    // Mark true all mask positions corresponding to guess
    for(int k=0; k < N; ++k) {
      if (answer is the same as guess) {
	       mask[k] = 1;
      }
    }

    // Determine whether the player has won!
    gameover = 1;
    for(int m = 0; m < N; ++m) {
      if (!mask[m]) {
        gameover = 0;
        break;
      }
    }
  }

  // Print victory message!
  printf("Victory! The word is %s!\n", answer);

  return 0;
}
