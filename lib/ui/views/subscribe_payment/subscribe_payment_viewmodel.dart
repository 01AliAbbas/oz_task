
import 'package:stacked/stacked.dart';

class SubscribePaymentViewmodel extends BaseViewModel {
  bool _usePoints = false;
  
  bool get usePoints => _usePoints;
  
  void togglePoints(bool value) {
    _usePoints = value;
    notifyListeners();
  }
}