import 'package:flutter/material.dart';

// Defining the BuyAirtimePage class
class BuyAirtimePage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController numberController = TextEditingController(); // Controller for the phone number input
  final TextEditingController amountController = TextEditingController(); // Controller for the airtime amount input

  BuyAirtimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Airtime'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the column's content vertically
          children: [
            // Input field for phone number
            TextField(
              controller: numberController, // Connect the controller to manage the phone number input
              decoration: const InputDecoration(
                labelText: 'Phone Number', // Label for the phone number input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.phone, // Numeric keyboard for phone number input
              maxLength: 10, // Limit phone number to 10 digits
            ),
            const SizedBox(height: 16.0), // Space between the input fields

            // Input field for airtime amount
            TextField(
              controller: amountController, // Connect the controller to manage the airtime amount input
              decoration: const InputDecoration(
                labelText: 'Amount', // Label for the airtime amount input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering amount
            ),
            const SizedBox(height: 20.0), // Space between the input fields and the button

            // Buy Airtime button
            ElevatedButton(
              onPressed: () {
                // Logic to handle the buy airtime action when the button is pressed
                String number = numberController.text.trim(); // Get the phone number from the input field
                String amountStr = amountController.text.trim(); // Get the airtime amount from the input field

                // Input validation
                if (number.length != 10) {
                  _showErrorDialog(context, 'Phone number must be 10 digits.');
                  return;
                }

                // Convert amount string to number
                double? amount = double.tryParse(amountStr);
                if (amount == null || amount <= 0 || amount > 5000) {
                  _showErrorDialog(context, 'Amount must be a positive number and cannot exceed 5000.');
                  return;
                }

                // Confirm buy airtime action
                print('Buying \$${amount.toStringAsFixed(2)} of airtime for $number'); // Debug output to console
                _showSuccessDialog(context, number, amount); // Show success dialog
              }, // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 179, 64, 64), // Background color of the button
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding inside the button
              ),
              child: const Text('Buy Airtime'), // Text displayed on the button
            ),
          ],
        ),
      ),
    );
  }

  // Method to show an error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog when pressed
              },
            ),
          ],
        );
      },
    );
  }

  // Method to show a success dialog
  void _showSuccessDialog(BuildContext context, String number, double amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text('Successfully bought \$${amount.toStringAsFixed(2)} of airtime for $number!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog when pressed
              },
            ),
          ],
        );
      },
    );
  }
}
