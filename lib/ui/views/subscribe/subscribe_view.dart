
import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';
import 'package:oz_task/ui/views/subscribe/subscribe_viewmodel.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';
import 'package:stacked/stacked.dart';

class SubscribeView extends StackedView<SubscribeViewmodel>   {
  const SubscribeView({super.key});

  @override
  Widget builder(BuildContext context, SubscribeViewmodel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subscribe", style: AppTextStyles.title1.black),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ImageIcon(
                  AssetImage("assets/coffe.png"),
                  color: eazyBlue,
                ),
                horizontalSpaceSmall,
                Text("2000", style: AppTextStyles.bodyBold.black),
                horizontalSpaceTiny,
                Text("pts", style: AppTextStyles.caption.grey),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              createTicketCard("Discount up to 20%", "Learn for more info", "100"),
              verticalSpaceMedium,
              createTicketCard("Discount up to 25%", "Learn for more info", "85"),
              verticalSpaceMedium,
              createTicketCard("Discount up to 2.5 BD", "Learn for more info", "55"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SubscribeViewmodel viewModelBuilder(BuildContext context) => SubscribeViewmodel();

}
  Widget createTicketCard(String title, String subtitle, String voucherNumber) {
    return ViewModelBuilder<SubscribeViewmodel>.reactive(
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.navigateToSubscribeDetails(
          title: title,
          subtitle: subtitle,
          voucherNumber: voucherNumber,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Icon
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: eazyBlue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.percent,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      horizontalSpaceSmall,
                      // Title and Subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.bodyBold.black,
                            ),
                            verticalSpaceTiny,
                            Text(
                              subtitle,
                              style: AppTextStyles.caption.withColor(Colors.grey[500]!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Dashed lin
              Container(
                width: 1,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: List.generate(10, (index) => 
                    Expanded(
                      child: Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        color: index.isEven ? Colors.grey[600] : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Voucher
              Container(
                width: 85,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      voucherNumber,
                      style: AppTextStyles.title1.black,
                    ),
                    const Text(
                      'Voucher',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Top notch
          Positioned(
            right: 85 + 8 - 16, 
            top: -16, // half outside the card
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          
          // Bottom notch
          Positioned(
            right: 85 + 8 - 16, // Center of the dashed line area
            bottom: -16, // Half outside the card
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
        ),
      ),
      viewModelBuilder: () => SubscribeViewmodel(),
    );
  }
