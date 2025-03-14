import 'package:chat_app/core/nav_bar/nav_bar.dart';
import 'package:chat_app/features/auth/presentation/auth_screen.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_body.dart';
import 'package:chat_app/features/chat/chat_screen.dart';
import 'package:chat_app/features/lenta/lenta_screen.dart';
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
      home:
          // ChatScreen()
          // LentaScreen()
          NavScreen(),
      // AuthScreen(),
    );
  }
}
