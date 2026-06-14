import 'package:flutter_test/flutter_test.dart';
import 'package:modul11_app/main.dart';
import 'package:modul11_app/screens/main_navigation_hub.dart';

void main() {
  testWidgets('Smoke test untuk mengecek load awal aplikasi', (WidgetTester tester) async {
    // Membangun aplikasi kita (InventoryApp) dan memicu frame.
    await tester.pumpWidget(const InventoryApp());

    // Memastikan bahwa Hub Navigasi Utama berhasil dimuat ke layar.
    expect(find.byType(MainNavigationHub), findsOneWidget);
  });
}