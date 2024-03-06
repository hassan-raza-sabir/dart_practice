// Text Analyzer:

// Features:
// Accept user input text.
// Count the number of words, characters, and sentences.
// Find the longest word and display statistics.
// Offer basic text manipulation features (e.g., reverse the text, count specific characters).
// Focuses on:
// String manipulation functions (split, length, substring)
// Loops and conditional statements
// Working with basic data structures (lists)

import 'dart:io';

int? _charCount(String text, String char) {
  return text.split('').where((a) => a == char).length;
}

String? reverse(String text) {
  return text.split('').reversed.join('');
}

String _longestWord(String text) {
  return text.split(' ').reduce((a, b) => a.length >= b.length ? a : b);
}

int? countWords(String text) {
  return text.split(' ').length;
}

int? countSentences(String text) {
  return text.split('. ').length;
}

void main() {
  print("Enter some text:");
  String text = stdin.readLineSync()!;

  // Analyze text
  int? wordCount = countWords(text);
  int? characterCount = text.length;
  int? sentenceCount = countSentences(text);
  String longestWord = _longestWord(text);

  // Display results
  print("Word count: $wordCount");
  print("Character count: $characterCount");
  print("Sentence count: $sentenceCount");
  print("Longest word: $longestWord");

  // Optional: Offer basic text manipulation features
  print("\nAdditional options:");
  print("1. Reverse text");
  print("2. Count specific characters");
  print("Enter your choice (1 or 2):");
  String choice = stdin.readLineSync()!;

  switch (choice) {
    case '1':
      print("Reversed text: ${reverse(text)}");
      break;
    case '2':
      print("Enter a character to count:");
      String char = stdin.readLineSync()!;
      int? charCount = _charCount(text, char);
      print("Count of '$char': $charCount");
      break;
    default:
      print("Invalid choice.");
  }
}
