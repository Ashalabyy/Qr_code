import 'package:flutter/material.dart';

import 'package:google_auth/screens/tabs_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr',
      home: TabsScreen(),
    );
  }
}
