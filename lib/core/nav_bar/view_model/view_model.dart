import 'package:chat_app/core/model/nav_model.dart';
import 'package:chat_app/features/chat/chat_screen.dart';
import 'package:chat_app/features/lenta/lenta_screen.dart';
import 'package:flutter/material.dart';

class ViewModelNavBar extends ChangeNotifier {
  final _chatKey = GlobalKey<NavigatorState>();
  final _lentaKey = GlobalKey<NavigatorState>();
  int _selectedTab = 0;
  List<NavModel> _items = [];

  ViewModelNavBar() {
    _items = [
      NavModel(page: const ChatScreen(), navKey: _chatKey),
      NavModel(page: const LentaScreen(), navKey: _lentaKey)
    ];
  }

  int get selectedTab => _selectedTab;
  List<NavModel> get items => _items;

  set selectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
