import 'package:auto_route/annotations.dart';
import 'package:ecash/pages/bookkeeping_page.dart';
import 'package:ecash/pages/cart_page.dart';
import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/login_page.dart';
import 'package:ecash/pages/main_page.dart';
import 'package:ecash/pages/menu_page.dart';
import 'package:ecash/pages/recipt_page.dart';
import 'package:ecash/pages/registration_page.dart';
import 'package:ecash/pages/root_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: RootPage,
      initial: true,
    ),
    AutoRoute(path: '/home', page: HomePage),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/main', page: MainPage),
    AutoRoute(path: '/cart', page: CartPage),
    AutoRoute(path: '/registration', page: RegistrationPage),
    AutoRoute(path: '/recipt', page: ReciptPage),
    AutoRoute(path: '/menu', page: MenuPage),
  ],
)
class $AppRouter {}
