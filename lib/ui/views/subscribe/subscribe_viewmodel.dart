
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:oz_task/app/app.locator.dart';
import 'package:oz_task/app/app.router.dart';

class SubscribeViewmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // Navigate to subscribe details page with hardcoded data
  void navigateToSubscribeDetails({
    required String title,
    required String subtitle,
    required String voucherNumber,
  }) {
    // For UI simulation, just navigate to the details page
    // The details page will show its own hardcoded content
    _navigationService.navigateTo(Routes.subscribeDetailsView);
  }
}