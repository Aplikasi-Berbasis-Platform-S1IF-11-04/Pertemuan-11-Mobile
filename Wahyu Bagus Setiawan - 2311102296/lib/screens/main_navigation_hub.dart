import 'package:flutter/material.dart';
import '../services/app_notification_service.dart';
import 'product_catalog_screen.dart';
import 'account_profile_screen.dart';
import 'app_info_screen.dart';

class MainNavigationHub extends StatefulWidget {
  const MainNavigationHub({super.key});

  @override
  State<MainNavigationHub> createState() => _MainNavigationHubState();
}

class _MainNavigationHubState extends State<MainNavigationHub> with SingleTickerProviderStateMixin {
  int _currentTabIndex = 0;
  late TabController _tabController;

  final List<String> _tabTitles = ['VAULT KATALOG', 'KREDENSI STAF', 'CORE ENGINE INFO'];

  final List<Widget> _pages = [
    const ProductCatalogScreen(),
    const AccountProfileScreen(),
    const AppInfoScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection(int index) {
    if (_currentTabIndex != index) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mengalihkan transmisi ke: ${_tabTitles[index]}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xff00ffcc),
          duration: const Duration(milliseconds: 600),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

      AppNotificationService.instance.triggerAlert(
        head: 'Alokasi Menu',
        body: 'Mengakses direktori ${_tabTitles[index]}',
      );
    }
    setState(() {
      _currentTabIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabTitles[_currentTabIndex],
          style: const TextStyle(letterSpacing: 2, fontWeight: FontWeight.w900, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bolt, color: Color(0xff00ffcc)),
            onPressed: () {
              AppNotificationService.instance.triggerAlert(
                head: 'Sistem Diagnostik',
                body: 'Enkripsi data week 11 berjalan stabil pada 60 FPS.',
              );
            },
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff161b22),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff00ffcc).withValues(alpha: 0.2), width: 1),
          boxShadow: [
            BoxShadow(color: const Color(0xff00ffcc).withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -2))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            currentIndex: _currentTabIndex,
            onTap: _handleTabSelection,
            backgroundColor: Colors.transparent,
            selectedItemColor: const Color(0xff00ffcc),
            unselectedItemColor: Colors.grey.shade600,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), label: 'Vault'),
              BottomNavigationBarItem(icon: Icon(Icons.fingerprint), label: 'Staf'),
              BottomNavigationBarItem(icon: Icon(Icons.settings_input_antenna), label: 'Engine'),
            ],
          ),
        ),
      ),
    );
  }
}