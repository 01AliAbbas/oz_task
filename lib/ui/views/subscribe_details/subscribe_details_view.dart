import 'package:flutter/material.dart';
import 'package:oz_task/app/app.locator.dart';
import 'package:oz_task/app/app.router.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';
import 'package:oz_task/ui/views/subscribe/subscribe_view.dart';
import 'package:oz_task/ui/views/subscribe_details/subscribe_details_viewmodel.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SubscribeDetailsView extends StackedView<SubscribeDetailsViewmodel> {
  const SubscribeDetailsView({super.key});

  @override
  Widget builder(BuildContext context, SubscribeDetailsViewmodel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Details", style: AppTextStyles.title1.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Ticket Card (same as clicked)
            createTicketCard("Discount up to 20%", "Learn for more info", "100"),
            
            verticalSpaceLarge,
            
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/promo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            verticalSpaceLarge,

            buildInfoSection(
              title: "How does this subscription plan work?",
              content: "If you have subscribed, this voucher will be added automatically to every transaction you make. There are no minimum purchases from certain stores, so you are free to make transactions every day!",
            ),
            
            verticalSpaceLarge,
            
            buildInfoSection(
              title: "How do I renew and cancel?",
              content: "Currently, you have to renew manually and choose the payment that we provide if the package has run out. Meanwhile, if you want to cancel, you just need to press the help button in the top right corner of this page and cancel at any time without charge.",
            ),
            
            verticalSpaceLarge,
            
            // 5. Subscribe Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().navigateTo(Routes.subscribePaymentView);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: eazyBlue,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Subscribe - BHD 245",
                  style: AppTextStyles.bodyBold.white,
                ),
              ),
            ),
            
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }
  @override
  SubscribeDetailsViewmodel viewModelBuilder(BuildContext context) => SubscribeDetailsViewmodel();
}
  Widget buildInfoSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.title2.black,
        ),
        verticalSpaceMedium,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            content,
            style: AppTextStyles.body.withColor(Colors.grey[700]!),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
