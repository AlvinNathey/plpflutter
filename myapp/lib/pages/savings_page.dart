import 'package:flutter/material.dart';
import 'deposit.dart'; // Import the DepositPage

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example savings details
    double totalSavings = 10000.00; // Replace this with your dynamic data
    double interestRate = 5.0; // Example interest rate
    String lastDepositDate = '2024-09-01'; // Example last deposit date

    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings'),
        backgroundColor: const Color(0xFFB00020), // Set a color for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total Savings:',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${totalSavings.toStringAsFixed(2)}', // Format savings amount
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Space between sections
              Text(
                'Interest Rate: ${interestRate.toStringAsFixed(1)}%', // Display interest rate
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Last Deposit: $lastDepositDate', // Display last deposit date
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30), // Space before button
              ElevatedButton(
                onPressed: () {
                  // Logic to navigate to the savings deposit page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DepositPage()), // Ensure DepositPage is constant
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB00020), // Button color
                ),
                child: const Text('Add to Savings'), // Button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
