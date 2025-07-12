import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/bottom_nav_bar.dart';
import 'package:oz_task/ui/views/home/tabs/home_tab_view.dart';
import 'package:oz_task/ui/views/home/tabs/offers_tab_view.dart';
import 'package:oz_task/ui/views/home/tabs/orders_tab_view.dart';
import 'package:oz_task/ui/views/home/tabs/profile_tab_view.dart';
import 'package:oz_task/ui/views/home/widgets/app_bar.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: viewModel.selectedIndex,
        onItemTapped: viewModel.setSelectedIndex,
      ),
      appBar: const TopBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: _getSelectedTabView(viewModel.selectedIndex),
        ),
      ),
    );
  }

  Widget _getSelectedTabView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const HomeTabView();
      case 1:
        return const OffersTabView();
      case 2:
        return const OrdersTabView();
      case 3:
        return const ProfileTabView();
      default:
        return const HomeTabView();
    }
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
