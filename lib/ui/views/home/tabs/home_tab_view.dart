import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/shop_ItemModel.dart';
import 'package:oz_task/ui/common/shops_gridView.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';
import 'package:oz_task/ui/views/home/horizontal_images_view.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpaceMedium,
          // Service buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServiceButton(
                icon: const Icon(Icons.shopify_sharp, color: Colors.white, size: 24),
                label: 'Pickup',
                onTap: () {},
              ),
              ServiceButton(
                icon: const Icon(Icons.delivery_dining, color: Colors.white, size: 24),
                label: 'Delivery',
                onTap: () {},
              ),
              ServiceButton(
                icon: const ImageIcon(AssetImage("assets/Small Icon.png"), color: Colors.white, size: 24,),
                label: 'Subscribe',
                onTap: () {},
              ),
              ServiceButton(
                icon: const Icon(Icons.more_horiz, color: Colors.white, size: 24),
                label: 'More',
                onTap: () {},
              ),
            ],
          ),
          verticalSpaceMedium,
          HorizontalImageCards(),
          verticalSpaceSmall,
          ShopGrid(shops: [
            ShopItem(name: "Goodtime Cafe 28", imagePath: "assets/Place Image Here.png", address: "Jl. ZA. Pagar Alam No. 43", isOpen: true, deliveryTime: 21, distance: 2.1, rating: 4),
            ShopItem(name: "Arabica Cafe 123", imagePath: "assets/Place Image Here2.png", address: "Jl. ZA. Pagar Alam , Bandar Lamp...", isOpen: false, deliveryTime: 50, distance: 4.8, rating: 4.5),
            ShopItem(name: "Oz Cafe", imagePath: "assets/Place Image 3.png", address: "Jl. ZA. Pagar Alam No. 45", isOpen: true, deliveryTime: 30, distance: 5, rating: 5),
          ])
        ],
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const ServiceButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: eazyBlue,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.caption.black,
            ),
          ],
        ),
      ),
    );
  }
}
