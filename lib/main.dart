import 'package:flutter/material.dart';
import 'package:oz_task/app/app.bottomsheets.dart';
import 'package:oz_task/app/app.dialogs.dart';
import 'package:oz_task/app/app.locator.dart';
import 'package:oz_task/ui/views/startup/startup_view.dart';
import 'package:oz_task/ui/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oz Task',
      home: const StartupView(),
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      routes: {
        '/startup': (context) => const StartupView(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}
