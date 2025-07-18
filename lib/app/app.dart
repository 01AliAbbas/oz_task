import 'package:oz_task/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:oz_task/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:oz_task/ui/views/home/home_view.dart';
import 'package:oz_task/ui/views/subscribe/subscribe_view.dart';
import 'package:oz_task/ui/views/subscribe_details/subscribe_details_view.dart';
import 'package:oz_task/ui/views/startup/startup_view.dart';
import 'package:oz_task/ui/views/subscribe_payment/subscribe_payment_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: SubscribeView),
    MaterialRoute(page: SubscribeDetailsView),
    MaterialRoute(page: SubscribePaymentView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
