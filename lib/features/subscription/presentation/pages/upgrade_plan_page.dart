import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/presentation/widgets/pricing_card.dart';

class UpgradePlanPage extends StatefulWidget {
  const UpgradePlanPage({super.key});

  @override
  State<UpgradePlanPage> createState() => _UpgradePlanPageState();
}

class _UpgradePlanPageState extends State<UpgradePlanPage> {
  int selectedPlan = 0; // 0 for monthly, 1 for annually

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E4F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Upgrade Plan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Illustration
            Container(
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background circles
                  Positioned(
                    top: 20,
                    left: 50,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 40,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 60,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Main illustration (simplified)
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.rocket_launch,
                      size: 60,
                      color: Color(0xFF6366F1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Title and description
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
            const SizedBox(height: 40),
            // Pricing plans
            PricingCard(
              title: 'Monthly',
              price: '\$5 USD',
              period: '/ Month',
              description: 'Include Family Sharing',
              isSelected: selectedPlan == 0,
              isPopular: true,
              icon: Icons.play_circle_filled,
              onTap: () {
                setState(() {
                  selectedPlan = 0;
                });
              },
            ),
            const SizedBox(height: 16),
            PricingCard(
              title: 'Annually',
              price: '\$50 USD',
              period: '/ Year',
              description: 'Include Family Sharing',
              isSelected: selectedPlan == 1,
              icon: Icons.calendar_today,
              onTap: () {
                setState(() {
                  selectedPlan = 1;
                });
              },
            ),
            const SizedBox(height: 40),
            // Continue button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to home or show success
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}