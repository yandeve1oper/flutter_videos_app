class BasePage {
  final String path;
  final String title;

  const BasePage({required this.path, required this.title});
}

class RootPages {
  static const home = BasePage(path: '/', title: 'Home');
  static const auth = BasePage(path: '/auth', title: 'Login');
}

class HomePages {
  static const root = RootPages.home;
  static const profile = BasePage(path: '/profile', title: 'Profile');
}
