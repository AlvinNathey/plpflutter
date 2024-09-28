import 'package:flutter/material.dart';

// Defining the DepositPage class
class DepositPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController amountController = TextEditingController(); // Controller for deposit amount input
  final String depositMethod = "Bank Account";

  DepositPage({super.key}); // Placeholder for deposit method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'), // Title displayed in the AppBar
        backgroundColor: const Color(0xFFB00020), // Subtle reddish background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Input field for deposit amount
            TextField(
              controller: amountController, // Connect the controller to the input field
              decoration: const InputDecoration(
                labelText: 'Deposit Amount', // Label displayed in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
              keyboardType: TextInputType.number, // Show numeric keyboard for amount input
            ),
            const SizedBox(height: 16.0), // Add space between the fields
            // Deposit method selection (for simplicity, using a placeholder)
            DropdownButtonFormField<String>(
              value: depositMethod,
              decoration: const InputDecoration(
                labelText: 'Deposit Method', // Label displayed in the dropdown
                border: OutlineInputBorder(), // Outline border style for the dropdown
              ),
              items: const [
                DropdownMenuItem<String>(
                  value: 'Bank Account',
                  child: Text('Bank Account'), // Option for deposit method
                ),
                DropdownMenuItem<String>(
                  value: 'Debit/Credit Card',
                  child: Text('Debit/Credit Card'), // Option for deposit method
                ),
                // Add more methods as needed
              ],
              onChanged: (String? newValue) {
                // Handle method change if needed
              },
            ),
            const SizedBox(height: 20.0), // Add space between the fields and button
            // Deposit button
            ElevatedButton(
              onPressed: () {
                // Handle deposit action when the button is pressed
                String amountText = amountController.text; // Get the amount from input
                double? amount = double.tryParse(amountText); // Try to parse the amount to double

                // Check if amount is valid and within the limit
                if (amount == null || amount <= 0 || amount > 100000) {
                  // Show error message if invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid amount (1 - 100,000).'),
                      duration: Duration(seconds: 3), // Message duration
                    ),
                  );
                } else {
                  // Add your deposit logic here (e.g., API call)
                  print('Depositing $amount via $depositMethod'); // Debug output to console
                  // Optionally show a success message or navigate to another page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Deposit successful!'),
                      duration: Duration(seconds: 3), // Message duration
                    ),
                  );
                }
              }, // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB00020), // Subtle reddish background color of the button
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding for the button
              ),
              child: const Text('Deposit'),
            ),
          ],
        ),
      ),
    );
  }
}
