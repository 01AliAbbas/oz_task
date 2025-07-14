
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:oz_task/app/app.locator.dart';
import 'package:oz_task/app/app.router.dart';

class SubscribeViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToSubscribeDetails({
    required String title,
    required String subtitle,
    required String voucherNumber,
  }) {
    _navigationService.navigateTo(Routes.subscribeDetailsView);
  }
}