import 'package:flutter/material.dart';

// Defining the LoginPage class
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for retrieving the text from TextFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable to manage password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to PocketWallet',
          style: TextStyle(color: Colors.white), // AppBar title
        ),
        backgroundColor: Colors.redAccent, // Changed to reddish color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: <Widget>[
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.redAccent, // Changed headline color to reddish
                  ), // Uses the headline style from the app theme
            ),
            const SizedBox(height: 20), // Space between title and email field
            TextField(
              controller: _emailController, // Assigning controller
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
            TextField(
              controller: _passwordController, // Assigning controller
              obscureText: !_isPasswordVisible, // Toggle visibility
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
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20), // Space before the login button
            ElevatedButton(
              onPressed: () {
                // Check the credentials against the registered values
                // For demonstration, we'll assume these are the correct credentials
                const String registeredEmail = 'kariukialvin32.com'; // Example registered email
                const String registeredPassword = 'pass123'; // Example registered password

                if (_emailController.text == registeredEmail &&
                    _passwordController.text == registeredPassword) {
                  Navigator.pushReplacementNamed(context, '/dashboard'); // Navigate to Dashboard
                } else {
                  // Show error message if credentials do not match
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid email or password')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Button background color changed to reddish
                foregroundColor: Colors.white, // Button text color changed to white
              ),
              child: const Text('Login'), // Button text
            ),
            const SizedBox(height: 10), // Space before the register link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Navigate to Register page
              }, // Register link text
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent, // Text color changed to reddish
              ),
              child: const Text("Don't have an account? Register here"),
            ),
          ],
        ),
      ),
    );
  }
}
