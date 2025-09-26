import 'package:flutter/material.dart';

class UpgradeTitleSection extends StatelessWidget {
  const UpgradeTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Seamless Anime\nExperience, Ad-Free.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Enjoy unlimited anime streaming without\ninterruptions.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}