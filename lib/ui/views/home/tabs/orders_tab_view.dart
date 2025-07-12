import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';

class OrdersTabView extends StatefulWidget {
  const OrdersTabView({Key? key}) : super(key: key);

  @override
  State<OrdersTabView> createState() => _OrdersTabViewState();
}

class _OrdersTabViewState extends State<OrdersTabView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceMedium,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TabBar(
            controller: tabController,
            indicator: BoxDecoration(
              color: eazyBlue,
              borderRadius: BorderRadius.circular(25),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Completed'),
              Tab(text: 'On Process'),
            ],
          ),
        ),
        verticalSpaceMedium,
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              _buildCompletedOrders(),
              _buildOnProcessOrders(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompletedOrders() {
    final completedOrders = [
      {
        'cafeName': 'Starbucks Coffee',
        'orderType': 'Delivery',
        'totalAmount': 5.0,
        'orderDate': '2024-01-15',
        'orderId': 'ORD001'
      },
      {
        'cafeName': 'Costa Coffee',
        'orderType': 'Pickup',
        'totalAmount': 3.5,
        'orderDate': '2024-01-12',
        'orderId': 'ORD002'
      },
    ];

    if (completedOrders.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No Completed Orders',
              style: AppTextStyles.title1,
            ),
            SizedBox(height: 8),
            Text(
              'Your completed orders will appear here',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: completedOrders.length,
      itemBuilder: (context, index) {
        final order = completedOrders[index];
        return _buildOrderCard(
          cafeName: order['cafeName'] as String,
          orderType: order['orderType'] as String,
          totalAmount: order['totalAmount'] as double,
          orderDate: order['orderDate'] as String,
          orderId: order['orderId'] as String,
        );
      },
    );
  }

  Widget _buildOnProcessOrders() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No Orders in Process',
            style: AppTextStyles.title1,
          ),
          SizedBox(height: 8),
          Text(
            'Your current orders will appear here',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String cafeName,
    required String orderType,
    required double totalAmount,
    required String orderDate,
    required String orderId,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    cafeName,
                    style: AppTextStyles.bodyBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  _formatDate(orderDate),
                  style: AppTextStyles.bodyLight.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Order type
            Row(
              children: [
                Icon(
                  orderType == 'Delivery' ? Icons.delivery_dining : Icons.store,
                  size: 16,
                  color: eazyBlue,
                ),
                const SizedBox(width: 4),
                Text(
                  orderType,
                  style: AppTextStyles.bodyLight.copyWith(
                    color: eazyBlue,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Total amount
            Text(
              'Total: ${totalAmount.toStringAsFixed(2)} BD',
              style: AppTextStyles.bodyBold.copyWith(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: eazyBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Order Again',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${date.day} ${months[date.month - 1]}, ${date.year}';
    } catch (e) {
      return dateString;
    }
  }



}
