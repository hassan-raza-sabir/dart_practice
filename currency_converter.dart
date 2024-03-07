// . Currency Converter:

// Features:
// Allow user to select input and output currencies from a list.
// Enter an amount in the input currency.
// Calculate and display the converted amount based on exchange rates (use a mock data source or API).
// Focuses on:
// Working with maps and accessing data by key (currency codes)
// Performing calculations with floating-point numbers
// User interface design using Dart's print statements (for this project)

import 'dart:io';

void main() {
  final Map<String, double> exchangerates = {
    'USD': 1.0,
    'GBP': 0.82,
    'YEN': 114.90
  };
  print('Available Currencies:');
  for (var i in exchangerates.keys) {
    print('- $i');
  }
  String inputCurrency, outputCurrency;
  print('=> Select Input Currency');
  inputCurrency = stdin.readLineSync()!.toUpperCase();
  print('=> Select Output Currency');
  outputCurrency = stdin.readLineSync()!.toUpperCase();
  double conversionRate =
      exchangerates[outputCurrency]! / exchangerates[inputCurrency]!;
  print('**The Conversion rate will be $conversionRate**');
  print('Enter amount to convert');
  double amount;
  while (true) {
    try {
      amount = double.parse(stdin.readLineSync()!);
      break; // Valid input received, exit loop
    } catch (e) {
      print("Invalid input. Please enter a number.");
    }
  }
  final amounted = amount * conversionRate;
  print("The $amount $inputCurrency is $amounted $outputCurrency.");
}
