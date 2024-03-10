//  Password Generator:

// Features:
// Allow user to specify password length and desired complexity (lowercase, uppercase, numbers, symbols).
// Generate a random password based on user choices.
// Display the generated password with an option to copy it.
// Focuses on:
// Random character generation (using dart:math)
// String manipulation and concatenation
// Conditional statements for building password complexity

import 'dart:math';
import 'dart:io';

List<String> lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz'.split('');
List<String> uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
List<String> numbers = '0123456789'.split('');
List<String> symbols = '!@#\$%^&*()-_=+[]{};:\'\"\,.<>/?'.split('');

int passwordLength = 0;
bool includeLowercase = false;
bool includeUppercase = false;
bool includeNumbers = false;
bool includeSymbols = false;

void main() {
  getPasswordDetails();
  String password = generatePassword();
  List<String> passwordChar = password.split('');
  passwordChar.shuffle(Random());
  String finalpass = passwordChar.take(passwordLength).join('');
  print('Your password is **  $finalpass  **');
}

String generatePassword() {
  String pass = '';
  if (includeLowercase == true) pass += lowercaseLetters.join();
  if (includeUppercase == true) pass += uppercaseLetters.join();
  if (includeNumbers == true) pass += numbers.join();
  if (includeSymbols == true) pass += symbols.join();
  return (pass);
}

void getPasswordDetails() {
  print('Input Length of Password: (1 to 50)');
  passwordLength = int.parse(stdin.readLineSync()!);
  List<String> characterTypes = [
    'lowercase alphabets',
    'uppercase alphabets',
    'numbers',
    'symbols'
  ];
  for (String type in characterTypes) {
    print("You want to include $type: (y/n)");
    String choice = stdin.readLineSync()!.toLowerCase();
    if (choice == 'y') {
      switch (type) {
        case 'lowercase':
          includeLowercase = true;
          break;
        case 'uppercase':
          includeUppercase = true;
          break;
        case 'numbers':
          includeNumbers = true;
          break;
        case 'symbols':
          includeSymbols = true;
          break;
      }
    } else {
      continue;
    }
  }
}
