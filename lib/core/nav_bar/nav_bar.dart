import 'package:chat_app/core/nav_bar/view_model/view_model.dart';
import 'package:chat_app/core/nav_bar/widgets/nav_bar_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModelNavBar(),
      child: const NavBarBody(),
    );
  }
}
