import 'package:flutter/material.dart';

// CustomCard widget definition
class CustomCard extends StatelessWidget {
  final String title; // Title for the card
  final IconData icon; // Icon for the card
  final VoidCallback onTap; // Callback for when the card is tapped

  // Constructor with required parameters
  const CustomCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  }); // Use key parameter for better widget management

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Define the tap action
      child: Card(
        elevation: 4, // Elevation for shadow effect
        margin: const EdgeInsets.all(10), // Margin around the card
        shape: RoundedRectangleBorder( // Optional: Customize the card's shape
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adjusted padding for better spacing
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48), // Display the icon
              const SizedBox(height: 10), // Spacing
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, // Bold title for emphasis
                ),
                textAlign: TextAlign.center, // Center the title text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
