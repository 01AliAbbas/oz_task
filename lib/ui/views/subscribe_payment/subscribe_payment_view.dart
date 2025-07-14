import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oz_task/app/app.locator.dart';
import 'package:oz_task/app/app.router.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';
import 'package:oz_task/ui/views/subscribe/subscribe_view.dart';
import 'package:oz_task/ui/views/subscribe_payment/subscribe_payment_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SubscribePaymentView extends StackedView<SubscribePaymentViewmodel> {
  const SubscribePaymentView({super.key});

  @override
  Widget builder(BuildContext context, SubscribePaymentViewmodel viewModel,
      Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribe Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order", style: AppTextStyles.bodyBold.black),
                TextButton(
                  onPressed: () {
                    print("clicked add");
                    locator<NavigationService>()
                        .navigateTo(Routes.subscribeView);
                  },
                  child: Text(
                    '+ Add Order',
                    style: AppTextStyles.caption.eazyBlue,
                  ),
                )
              ],
            ),
            createTicketCard(
                "Discount up to 20%", "Learn for more info", "100"),
            verticalSpaceMedium,
            Text('Payment Method', style: AppTextStyles.bodyBold.black),
            _buildWhiteContainer(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: Text("Oz Pay", style: AppTextStyles.body.black),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  verticalSpaceSmall,
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage("assets/coffe.png"),
                      color: Color.fromARGB(255, 201, 188, 162),
                    ),
                    title: Text("Points - 2000 pts",
                        style: AppTextStyles.body.black),
                    subtitle: Text(
                      "Use your points. (1 pt = 0.5 BHD)",
                      style: AppTextStyles.caption.grey,
                    ),
                    trailing: Switch(
                      value: viewModel.usePoints,
                      onChanged: viewModel.togglePoints,
                    ),
                    onTap: () {},
                  ),
                  Container(width: screenWidth(context) * 0.9, height: 1, color: const Color.fromARGB(255, 201, 201, 201),),
                  verticalSpaceSmall,
                  Container(
                    width: screenWidth(context) * 0.8,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: eazyBlue,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.percent,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        verticalSpaceMedium,
                        Expanded(
                          child: Text(
                            'Voucher Available',
                            style: AppTextStyles.bodyBold
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            Text("Payment Summary", style: AppTextStyles.bodyBold.black),
            _buildWhiteContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: AppTextStyles.body.black),
                      Text("245 BHD", style: AppTextStyles.body.black),
                    ],
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bonus Points", style: AppTextStyles.body.black),
                      Text("+5 pts", style: AppTextStyles.body.copyWith(color: Colors.green)),
                    ],
                  ),
                  verticalSpaceSmall,
                  const Divider(),
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: AppTextStyles.bodyBold.black),
                      Text("245 BHD", style: AppTextStyles.bodyBold.black),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: eazyBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Subscribe Now',
                  style: AppTextStyles.bodyBold.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhiteContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  SubscribePaymentViewmodel viewModelBuilder(BuildContext context) =>
      SubscribePaymentViewmodel();
}
