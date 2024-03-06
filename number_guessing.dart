// Number Guessing Game:

// Features:
//  Generate a random number.
//  Allow user input to guess the number.
//  Provide hints (higher/lower) and track the number
//  of attempts.
//  Announce a win/lose outcome.
// Focuses on:
//  Random number generation (using dart:math)
//  User input handling and data type conversion  (string to int)
// Loops (for/while) and conditional statements (if/else)

import 'dart:math';
import 'dart:io';

void main() {
  // genraterandom number
  final randomNumber = Random();
  final numberToGuess = randomNumber.nextInt(100) + 1;
  int guess, attempt = 0;
  do {
    attempt++;
    print('Enter Your Gusess');
    String input = stdin.readLineSync()!;
    guess = int.tryParse(input) ?? 0;
    if (guess > numberToGuess) {
      print('Too High! Guess lower.');
    } else if (guess < numberToGuess) {
      print('Too low! Guess Higher.');
    }
  } while (guess != numberToGuess);
  print('CONGRATS YOU WON! Your attempts were $attempt.');
}
