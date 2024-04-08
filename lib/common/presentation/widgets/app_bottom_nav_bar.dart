import 'package:flutter/material.dart';

import 'package:flutter_videos_app/core/router/app_router.dart';
import 'package:flutter_videos_app/core/router/pages.dart';

class AppBottomNavBar extends BottomNavigationBar {
  AppBottomNavBar({super.key}) : super(items: _navItems);

  static List<BottomNavigationBarItem> get _navItems => [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          activeIcon: const Icon(Icons.home, color: Colors.purple),
          label: HomePages.root.title,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          activeIcon: const Icon(Icons.account_circle, color: Colors.purple),
          label: HomePages.profile.title,
        ),
      ];

  @override
  ValueChanged<int>? get onTap => (int index) {
        switch (index) {
          case 0:
            AppRouter.router.go(HomePages.root.path);
            break;
          case 1:
            AppRouter.router.go(HomePages.profile.path);
            break;
        }
      };

  @override
  int get currentIndex {
    final location =
        AppRouter.router.routerDelegate.currentConfiguration.fullPath;

    if (location == HomePages.root.path) {
      return 0;
    }

    if (location == HomePages.profile.path) {
      return 1;
    }

    return 0;
  }
}
