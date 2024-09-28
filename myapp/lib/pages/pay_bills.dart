import 'package:flutter/material.dart';

// Defining the PayBillsPage class, which is a StatelessWidget
class PayBillsPage extends StatelessWidget {
  // Controllers to handle input for the bill number, account number, and amount
  final TextEditingController billNumberController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // List of available bill types for the dropdown menu
  final List<String> billTypes = [
    'DSTV',
    'Water',
    'Electricity',
    'Internet',
    'Mobile Recharge',
    'Netflix',
    'Showmax',
    'Insurance',
    'Gas',
    'Municipal Taxes',
  ];

  // Variable to store the currently selected bill type
  String selectedBillType = 'DSTV';

  PayBillsPage({super.key}); // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'), // Title displayed in the AppBar
        backgroundColor: const Color(0xFFB00020), // Subtle reddish color for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            // Dropdown button for selecting the type of bill
            DropdownButton<String>(
              value: selectedBillType, // Current selected bill type
              isExpanded: true, // Make dropdown take full width
              onChanged: (String? newValue) {
                // Update selected bill type when a new value is chosen
                if (newValue != null) {
                  selectedBillType = newValue;
                }
              },
              items: billTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value, // The value for the dropdown item
                  child: Row(
                    children: [
                      const Icon(Icons.receipt, size: 24), // Icon for the bill type
                      const SizedBox(width: 8), // Space between icon and text
                      Text(value), // Display the bill type text
                    ],
                  ),
                );
              }).toList(), // Convert the list of bill types to dropdown items
            ),
            const SizedBox(height: 16.0), // Space between the dropdown and input fields
            
            // Input field for entering the bill number
            TextField(
              controller: billNumberController,
              decoration: const InputDecoration(
                labelText: 'Bill Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0), // Space between input fields
            
            // Input field for entering the account number (only numbers allowed)
            TextField(
              controller: accountNumberController,
              keyboardType: TextInputType.number, // Only allow numbers
              decoration: const InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0), // Space between input fields
            
            // Input field for entering the amount to pay
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0), // Space between input fields and button
            
            // Button to trigger the payment action
            ElevatedButton(
              onPressed: () {
                // Validate input fields
                if (billNumberController.text.isEmpty ||
                    accountNumberController.text.isEmpty ||
                    amountController.text.isEmpty) {
                  // Show error message if any field is empty
                  _showSnackbar(context, 'Please fill in all fields.');
                  return;
                }

                // Parse the amount and validate it
                final double? amount = double.tryParse(amountController.text);
                if (amount == null || amount <= 0) {
                  _showSnackbar(context, 'Please enter a valid amount.');
                  return;
                }

                // Logic to handle payment would go here
                final billNumber = billNumberController.text;
                final accountNumber = accountNumberController.text;

                // Show a confirmation message using a Snackbar
                _showSnackbar(
                  context,
                  'Paying \$${amount.toStringAsFixed(2)} for $selectedBillType\nBill Number: $billNumber\nAccount Number: $accountNumber',
                );

                // Optionally clear the fields after payment
                billNumberController.clear();
                accountNumberController.clear();
                amountController.clear();
              }, // Button label
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB00020)),
              child: const Text('Send Payment'), // Subtle reddish button color
            ),
          ],
        ),
      ),
    );
  }

  // Method to show a Snackbar for messages
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3), // Message duration
      ),
    );
  }
}
