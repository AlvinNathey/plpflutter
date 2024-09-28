import 'package:flutter/material.dart';

class LoanPage extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  LoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Overview'),
        backgroundColor: const Color(0xFFB00020), // Subtle reddish color for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Current Loan Balance: \$5,000',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Total Loan Amount: \$10,000',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Interest Rate: 5%',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Payment Schedule: Monthly',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Apply for a Loan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Enter Loan Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _applyForLoan(context); // Handle loan application logic
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB00020)), // Subtle reddish button color
              child: const Text('Apply for Loan'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Loan History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Dummy data for loan history
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Loan Application - \$2,000'),
                    subtitle: Text('Status: Approved'),
                  ),
                  ListTile(
                    title: Text('Loan Application - \$1,000'),
                    subtitle: Text('Status: Pending'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyForLoan(BuildContext context) {
    final amountText = _amountController.text;
    final double? amount = double.tryParse(amountText); // Try to parse the input to a double

    // Validate the entered amount
    if (amount == null || amount <= 0 || amount > 500000) {
      // Show error message if invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid loan amount (1 - 500,000).'),
          duration: Duration(seconds: 3), // Message duration
        ),
      );
    } else {
      // Show confirmation dialog
      _showLoanConfirmation(context, amount);
    }
  }

  void _showLoanConfirmation(BuildContext context, double amount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Loan Application'),
          content: Text('You have applied for a loan of \$$amount.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Optionally, clear the input field after confirmation
                _amountController.clear();
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Loan application submitted!'),
                    duration: Duration(seconds: 3), // Message duration
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
