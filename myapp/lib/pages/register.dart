import 'package:flutter/material.dart'; // Importing Flutter material package

// Defining the RegisterPage class
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // State variables for managing password visibility
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Controllers to retrieve text from TextFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when not needed
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register to PocketWallet',
          style: TextStyle(color: Colors.white), // AppBar title
        ),
        backgroundColor: Colors.redAccent, // Changed to reddish color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: <Widget>[
            const Text(
              'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Title style
            ),
            const SizedBox(height: 20), // Space between title and name field
            
            // TextField for Name
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name', // Placeholder text
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Border color changed to reddish
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Focused border color changed to reddish
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between name and email fields
            
            // TextField for Email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email', // Placeholder text
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Border color changed to reddish
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Focused border color changed to reddish
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between email and password fields
            
            // TextField for Password
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword, // Hides the input for passwords
              decoration: InputDecoration(
                labelText: 'Password', // Placeholder text
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Border color changed to reddish
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Focused border color changed to reddish
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // Toggle password visibility
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between password and confirm password fields
            
            // TextField for Confirm Password
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword, // Hides the input for confirm password
              decoration: InputDecoration(
                labelText: 'Confirm Password', // Placeholder text
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Border color changed to reddish
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent), // Focused border color changed to reddish
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword; // Toggle password visibility
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20), // Space before the register button
            
            // Elevated Button for Register
            ElevatedButton(
              onPressed: () {
                // Validate fields before registering
                if (_passwordController.text == _confirmPasswordController.text) {
                  // Navigate to Login page after successful registration
                  Navigator.pop(context); // Go back to the Login page
                } else {
                  // Show error message if passwords do not match
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Passwords do not match!'), // Error message
                      backgroundColor: Colors.redAccent, // Error message background color
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Button background color
                foregroundColor: Colors.white, // Button text color
              ),
              child: const Text('Register'), // Button text
            ),
            const SizedBox(height: 10), // Space before the login link
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to Login page
              }, // Login link text
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent, // Text color
              ),
              child: const Text("Already have an account? Login here"),
            ),
          ],
        ),
      ),
    );
  }
}
