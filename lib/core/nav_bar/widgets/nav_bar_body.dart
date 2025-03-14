import 'package:chat_app/core/nav_bar/view_model/view_model.dart';
import 'package:chat_app/core/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarBody extends StatelessWidget {
  const NavBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ViewModelNavBar>();
    return WillPopScope(
      child: Scaffold(
        body: IndexedStack(
          index: vm.selectedTab,
          children: vm.items.map((page) {
            return Navigator(
              key: page.navKey,
              onGenerateInitialRoutes: (navigator, initialRoute) {
                return [MaterialPageRoute(builder: (context) => page.page)];
              },
            );
          }).toList(),
        ),
        bottomNavigationBar: BottomNavBarWidget(
            pageIndex: vm.selectedTab,
            onTap: (index) {
              if (index == vm.selectedTab) {
                vm.items[index].navKey.currentState?.popUntil((route) {
                  return route.isFirst;
                });
              } else {
                vm.selectedTab = index;
              }
            }),
      ),
      onWillPop: () {
        if (vm.items[vm.selectedTab].navKey.currentState?.canPop() ?? false) {
          vm.items[vm.selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
    );
  }
}
