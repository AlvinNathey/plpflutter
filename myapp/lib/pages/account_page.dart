import 'package:flutter/material.dart'; // Importing Flutter material package for UI components

// AccountPage is a StatefulWidget that represents the account overview screen
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Variables to hold user information
  String accountHolderName = "Alvin Nathey"; // Placeholder name
  String email = "kariukialvin32.com"; // Placeholder email
  String phone = "+254 708533178"; // Placeholder phone number
  String accountNumber = ""; // Placeholder for account number
  String accountBalance = ""; // Placeholder for account balance

  // TextEditingControllers for the editable fields
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _accountBalanceController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when not needed
    _accountNumberController.dispose();
    _accountBalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold provides the basic visual structure for the page
      appBar: AppBar( // AppBar widget for the top bar
        title: const Text(
          'Account Overview',
          style: TextStyle(color: Colors.white), // Title text color
        ),
        backgroundColor: Colors.redAccent, // Background color of the AppBar
      ),
      body: Padding( // Padding around the body content
        padding: const EdgeInsets.all(16.0), // Padding value set to 16 pixels on all sides
        child: Column( // Column widget to arrange child widgets vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
          children: <Widget>[
            // Displaying account holder's name
            Text(
              'Account Holder: $accountHolderName', // Display user's name
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent), // Styling the text
            ),
            const SizedBox(height: 10), // Spacing between elements
            
            // Card for account information
            Card(
              color: Colors.white, // Background color of the card
              elevation: 4, // Shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
                  children: [
                    // Displaying email information
                    Text(
                      'Email: $email', // Display user's email
                      style: const TextStyle(fontSize: 16), // Styling the text
                    ),
                    const SizedBox(height: 10), // Spacing between elements
                    
                    // Displaying phone information
                    Text(
                      'Phone: $phone', // Display user's phone number
                      style: const TextStyle(fontSize: 16), // Styling the text
                    ),
                    const SizedBox(height: 10), // Spacing between elements
                    
                    // Displaying account number
                    Text(
                      'Account Number: ${accountNumber.isEmpty ? "Not set" : accountNumber}', // Display account number
                      style: const TextStyle(fontSize: 16), // Styling the text
                    ),
                    const SizedBox(height: 10), // Spacing between elements
                    
                    // Displaying account balance
                    Text(
                      'Account Balance: ${accountBalance.isEmpty ? "\$0.00" : accountBalance}', // Display account balance
                      style: const TextStyle(fontSize: 16), // Styling the text
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing between elements
            
            // Button for editing account settings
            ElevatedButton(
              onPressed: () {
                // Show dialog to update account details
                _showAccountSettings(context);
              }, // Button text
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners for button
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Padding for button
              ),
              child: const Text(
                'Edit Account Settings', // Button text
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show account settings dialog
  void _showAccountSettings(BuildContext context) {
    showDialog(
      context: context, // Context for the dialog
      builder: (BuildContext context) {
        return AlertDialog( // AlertDialog widget for showing messages
          title: const Text('Update Account Details'), // Title of the dialog
          content: Column(
            mainAxisSize: MainAxisSize.min, // Take up minimal space
            children: [
              // Input for account number
              TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(labelText: 'Account Number'),
              ),
              const SizedBox(height: 10), // Spacing between elements
              // Input for account balance
              TextField(
                controller: _accountBalanceController,
                decoration: const InputDecoration(labelText: 'Account Balance'),
                keyboardType: TextInputType.number, // Numeric input
              ),
            ],
          ),
          actions: <Widget>[
            // Button to update details
            TextButton(
              child: const Text('Update'), // Button text
              onPressed: () {
                // Update account number and balance
                setState(() {
                  accountNumber = _accountNumberController.text;
                  accountBalance = _accountBalanceController.text;
                });
                Navigator.of(context).pop(); // Close the dialog when pressed
              },
            ),
            // Button to close the dialog
            TextButton(
              child: const Text('Cancel'), // Button text
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
