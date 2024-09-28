import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Defining the SendMoneyPage class
class SendMoneyPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController recipientController = TextEditingController(); // Controller for recipient's number input
  final TextEditingController amountController = TextEditingController();

  SendMoneyPage({super.key}); // Controller for amount input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'), // Title displayed in the AppBar
        backgroundColor: const Color(0xFFB00020), // Consistent AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Input field for recipient's number
            TextField(
              controller: recipientController, // Connect the controller to the input field
              decoration: const InputDecoration(
                labelText: 'Recipient\'s Number', // Label displayed in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
              keyboardType: TextInputType.phone, // Show numeric keyboard for phone number input
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly // Ensure only numbers are entered
              ],
            ),
            const SizedBox(height: 16.0), // Add space between the fields
            // Input field for amount
            TextField(
              controller: amountController, // Connect the controller to the input field
              decoration: const InputDecoration(
                labelText: 'Amount', // Label displayed in the input field
                border: OutlineInputBorder(), // Outline border style for the input field
              ),
              keyboardType: TextInputType.number, // Show numeric keyboard for amount input
            ),
            const SizedBox(height: 20.0), // Add space between the fields and button
            // Send Money button
            ElevatedButton(
              onPressed: () {
                // Handle send money action when the button is pressed
                String recipient = recipientController.text.trim(); // Get the recipient's number from input
                String amountText = amountController.text.trim(); // Get the amount from input

                // Validate input
                if (recipient.isEmpty || amountText.isEmpty) {
                  // Show error message if inputs are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter both recipient\'s number and amount.'),
                      duration: Duration(seconds: 3), // Message duration
                    ),
                  );
                  return;
                }

                double? amount = double.tryParse(amountText); // Try to parse the amount to double
                if (amount == null || amount <= 0) {
                  // Show error message if amount is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid amount greater than zero.'),
                      duration: Duration(seconds: 3), // Message duration
                    ),
                  );
                  return;
                }

                // Add your send money logic here (e.g., API call)
                print('Sending \$${amount.toStringAsFixed(2)} to $recipient'); // Debug output to console

                // Optionally show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Money sent successfully!'),
                    duration: Duration(seconds: 3), // Message duration
                  ),
                );

                // Clear input fields after sending money
                recipientController.clear();
                amountController.clear();
              }, // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB00020), // Consistent button color
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding for the button
              ),
              child: const Text('Send Money'),
            ),
          ],
        ),
      ),
    );
  }
}
