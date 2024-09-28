import 'package:flutter/material.dart';

// Defining the BankTransferPage class
class BankTransferPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController recipientNameController = TextEditingController(); // Controller for recipient's name input
  final TextEditingController accountNumberController = TextEditingController(); // Controller for recipient's account number input
  final TextEditingController amountController = TextEditingController(); // Controller for transfer amount input

  BankTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Transfer', style: TextStyle(color: Colors.white)), // Title displayed in the AppBar
        backgroundColor: Colors.redAccent, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column's content vertically
          children: [
            // Input field for recipient's name
            TextField(
              controller: recipientNameController, // Connects the controller to manage the recipient's name input
              decoration: const InputDecoration(
                labelText: 'Recipient\'s Name', // Label for the recipient's name input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
            ),
            const SizedBox(height: 16.0), // Space between the input fields

            // Input field for recipient's account number
            TextField(
              controller: accountNumberController, // Connects the controller to manage the account number input
              decoration: const InputDecoration(
                labelText: 'Recipient\'s Account Number', // Label for the account number input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering the account number
              maxLength: 12, // Limit account number to 12 digits
            ),
            const SizedBox(height: 16.0), // Space between the input fields

            // Input field for transfer amount
            TextField(
              controller: amountController, // Connects the controller to manage the transfer amount input
              decoration: const InputDecoration(
                labelText: 'Amount', // Label for the amount input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering the amount
            ),
            const SizedBox(height: 20.0), // Space between the input fields and button

            // Transfer button
            ElevatedButton(
              onPressed: () {
                // Logic to handle the bank transfer action when the button is pressed
                String recipientName = recipientNameController.text.trim(); // Get the recipient's name from input
                String accountNumber = accountNumberController.text.trim(); // Get the account number from input
                String amountStr = amountController.text.trim(); // Get the amount from input

                // Input validation
                if (recipientName.isEmpty || accountNumber.isEmpty || amountStr.isEmpty) {
                  _showErrorDialog(context, 'All fields must be filled out.');
                  return;
                }

                // Convert amount string to number
                double? amount = double.tryParse(amountStr);
                if (amount == null || amount <= 0) {
                  _showErrorDialog(context, 'Invalid amount. Please enter a positive number.');
                  return;
                }

                // Check for maximum transfer limit
                if (amount > 1000000) {
                  _showTemporaryMessage(context, 'Transfer amount cannot exceed 1 million.', 3);
                  return;
                }

                // Confirm transfer action
                _showConfirmationDialog(context, recipientName, accountNumber, amount);
              }, // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Background color of the button
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding inside the button
              ),
              child: const Text('Transfer'), // Text displayed on the button
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

  // Method to show a temporary message
  void _showTemporaryMessage(BuildContext context, String message, int duration) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Method to show confirmation dialog
  void _showConfirmationDialog(BuildContext context, String recipientName, String accountNumber, double amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Transfer'),
          content: Text('Transfer \$${amount.toStringAsFixed(2)} to $recipientName (Account: $accountNumber)?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog when pressed
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Logic for the actual transfer can be placed here
                print('Transferring \$${amount.toStringAsFixed(2)} to $recipientName (Account: $accountNumber)'); // Debug output to console
                Navigator.of(context).pop(); // Close the dialog when pressed
                _showSuccessDialog(context); // Show success message
              },
            ),
          ],
        );
      },
    );
  }

  // Method to show success dialog
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Transfer completed successfully!'),
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
