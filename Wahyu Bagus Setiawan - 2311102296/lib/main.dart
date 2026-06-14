import 'package:flutter/material.dart';
import 'services/app_notification_service.dart';
import 'screens/main_navigation_hub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppNotificationService.instance.setupNotifications();
  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neon Vault Week 11',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff0d1117),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff00ffcc),
          secondary: Color(0xff00b3ff),
          surface: Color(0xff161b22),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff161b22),
          foregroundColor: Color(0xff00ffcc),
          elevation: 0,
        ),
      ),
      home: const MainNavigationHub(),
    );
  }
}