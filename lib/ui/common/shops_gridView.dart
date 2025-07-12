import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';
import 'package:oz_task/ui/common/shop_ItemModel.dart';

class ShopGrid extends StatelessWidget {
  final List<ShopItem> shops;
  final Function(int)? onShopTap;
  
  const ShopGrid({
    super.key,
    required this.shops,
    this.onShopTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // For nested scrolling
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65, // Increased height to fit content
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: shops.length,
      itemBuilder: (context, index) => _ShopCard(
        shop: shops[index],
        onTap: () => onShopTap?.call(index),
      ),
    );
  }
}

class _ShopCard extends StatelessWidget {
  final ShopItem shop;
  final VoidCallback? onTap;

  const _ShopCard({
    required this.shop,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shop Image with Rating Tag
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    shop.imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Rating Tag
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: vintageCream,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          shop.rating.toStringAsFixed(1),
                          style: AppTextStyles.captionBold.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shop Name
                  Text(
                    shop.name,
                    style: AppTextStyles.bodyBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 2),
                  
                  // Address
                  Text(
                    shop.address,
                    style: AppTextStyles.caption.grey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 6),
                  
                  // Status & Details Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Open/Closed Status
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: shop.isOpen ? Colors.green[50] : Colors.red[50],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          shop.isOpen ? 'OPEN' : 'CLOSED',
                          style: AppTextStyles.caption.copyWith(
                            color: shop.isOpen ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      
                      // Distance
                      Text(
                        '${shop.distance} km',
                        style: AppTextStyles.caption.grey.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  if (shop.isOpen)
                  // Delivery Time
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Est. '),
                        TextSpan(
                          text: '${shop.deliveryTime} min',
                          style: AppTextStyles.caption.copyWith(
                            color: shop.deliveryTime <= 30 
                                ? Colors.green 
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    style: AppTextStyles.caption.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

