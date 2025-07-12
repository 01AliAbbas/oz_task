import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';

class OffersTabView extends StatelessWidget {
  const OffersTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpaceMedium,
          const Icon(
            Icons.percent,
            size: 100,
            color: Colors.grey,
          ),
          verticalSpaceSmall,
          const Text(
            'Offers & Promotions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceSmall,
          const Text(
            'Check out the latest deals and offers!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: const Column(
              children: [
                Text(
                  '🎉 Special Offer!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Get 20% off on your first order!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
