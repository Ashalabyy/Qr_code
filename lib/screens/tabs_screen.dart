import 'package:flutter/material.dart';
import 'package:google_auth/screens/qr_scan_create.dart';
import 'package:google_auth/screens/qr_scan_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> pages = [
    {
      'pages': const QrCodeCreate(),
    },
    {
      'pages': const QrScanPage(),
    }
  ];
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
