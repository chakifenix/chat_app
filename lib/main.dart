import 'package:chat_app/features/auth/presentation/view/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF2E6DF3)),
      home: AuthPage(),
    );
  }
}
