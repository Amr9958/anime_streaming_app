import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/upgrade_illustration_widget.dart';
import '../widgets/upgrade_title_section.dart';
import '../widgets/pricing_plans_section.dart';
import '../widgets/upgrade_continue_button.dart';

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
            const UpgradeIllustrationWidget(),
            const SizedBox(height: 40),
            // Title and description
            const UpgradeTitleSection(),
            const SizedBox(height: 40),
            // Pricing plans
            PricingPlansSection(
              selectedPlan: selectedPlan,
              onPlanSelected: (index) {
                setState(() {
                  selectedPlan = index;
                });
              },
            ),
            const SizedBox(height: 40),
            // Continue button
            UpgradeContinueButton(
              onPressed: () {
                // Navigate back to home or show success
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }


}