import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters

// Defining the WithdrawPage class
class WithdrawPage extends StatelessWidget {
  // Controllers to manage the input fields
  final TextEditingController amountController = TextEditingController(); // Controller for withdrawal amount input
  final TextEditingController pinController = TextEditingController(); // Controller for PIN input
  final TextEditingController agentNumberController = TextEditingController(); // Controller for agent number input

  // List of withdrawal options
  final List<String> withdrawalMethods = ['ATM', 'Agent']; // Available withdrawal methods
  String? selectedMethod;

  WithdrawPage({super.key}); // Variable to store the selected method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'), // Title displayed in the AppBar
        backgroundColor: const Color(0xFFB00020), // Consistent AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column's content vertically
          children: [
            // Dropdown for selecting the withdrawal method
            DropdownButton<String>(
              hint: const Text('Select Withdrawal Method'), // Placeholder text
              value: selectedMethod, // Current selected method
              onChanged: (String? newValue) {
                selectedMethod = newValue; // Update the selected method
              },
              items: withdrawalMethods.map<DropdownMenuItem<String>>((String method) {
                return DropdownMenuItem<String>(
                  value: method, // Value to be set on selection
                  child: Text(method), // Displayed text for each item
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0), // Space between the dropdown and the input fields

            // Input field for withdrawal amount
            TextField(
              controller: amountController, // Connects the controller to manage the amount input
              decoration: const InputDecoration(
                labelText: 'Withdrawal Amount', // Label for the amount input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering the amount
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly // Allow only digits
              ],
            ),
            const SizedBox(height: 16.0), // Space between the input fields

            // Input field for PIN
            TextField(
              controller: pinController, // Connects the controller to manage the PIN input
              decoration: const InputDecoration(
                labelText: 'Enter PIN', // Label for the PIN input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              obscureText: true, // Hides the input text for security
              keyboardType: TextInputType.number, // Numeric keyboard for entering the PIN
            ),
            const SizedBox(height: 16.0), // Space between the PIN input and agent number input

            // Conditional input field for agent number
            if (selectedMethod == 'Agent') ...[
              TextField(
                controller: agentNumberController, // Connects the controller to manage the agent number input
                decoration: const InputDecoration(
                  labelText: 'Agent Number', // Label for the agent number input field
                  border: OutlineInputBorder(), // Outline border around the input field
                ),
                keyboardType: TextInputType.phone, // Numeric keyboard for entering the agent number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
              ),
              const SizedBox(height: 16.0), // Space between the input fields
            ],

            // Withdraw button
            ElevatedButton(
              onPressed: () {
                // Logic to handle the withdrawal action when the button is pressed
                String amountText = amountController.text.trim(); // Get the withdrawal amount from the input field
                String pin = pinController.text.trim(); // Get the PIN from the input field
                String agentNumber = agentNumberController.text.trim(); // Get the agent number from the input field

                // Validate input
                if (selectedMethod == null) {
                  // Show error message if no withdrawal method is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a withdrawal method.'),
                      duration: Duration(seconds: 3), // Message duration
                    ),
                  );
                  return;
                }

                if (amountText.isEmpty || pin.isEmpty || (selectedMethod == 'Agent' && agentNumber.isEmpty)) {
                  // Show error message if inputs are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields.'),
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
                      content: Text('Please enter a valid withdrawal amount greater than zero.'),
                      duration: Duration(seconds: 3), // Message duration
                    ),
                  );
                  return;
                }

                // Add your withdrawal logic here (e.g., API call)
                if (selectedMethod == 'Agent') {
                  print('Withdrawing \$${amount.toStringAsFixed(2)} from Agent $agentNumber with PIN: $pin'); // Debug output to console
                } else {
                  print('Withdrawing \$${amount.toStringAsFixed(2)} from ATM with PIN: $pin'); // Debug output for ATM
                }

                // Optionally, you can show a confirmation message or navigate to another page after the operation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Withdrawal successful!'),
                    duration: Duration(seconds: 3), // Message duration
                  ),
                );

                // Clear input fields after withdrawal
                amountController.clear();
                pinController.clear();
                agentNumberController.clear();
                selectedMethod = null; // Reset selected method
              }, // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB00020), // Consistent button color
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding inside the button
              ),
              child: const Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
