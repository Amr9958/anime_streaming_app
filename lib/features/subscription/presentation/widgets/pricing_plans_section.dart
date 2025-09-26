import 'package:flutter/material.dart';
import '../../../../shared/presentation/widgets/pricing_card.dart';

class PricingPlansSection extends StatelessWidget {
  final int selectedPlan;
  final Function(int) onPlanSelected;

  const PricingPlansSection({
    super.key,
    required this.selectedPlan,
    required this.onPlanSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PricingCard(
          title: 'Monthly',
          price: '\$5 USD',
          period: '/ Month',
          description: 'Include Family Sharing',
          isSelected: selectedPlan == 0,
          isPopular: true,
          icon: Icons.play_circle_filled,
          onTap: () => onPlanSelected(0),
        ),
        const SizedBox(height: 16),
        PricingCard(
          title: 'Annually',
          price: '\$50 USD',
          period: '/ Year',
          description: 'Include Family Sharing',
          isSelected: selectedPlan == 1,
          icon: Icons.calendar_today,
          onTap: () => onPlanSelected(1),
        ),
      ],
    );
  }
}