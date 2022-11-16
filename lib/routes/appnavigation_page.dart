import 'package:flutter/material.dart';
import 'package:mehers_kitchen/screens/category/category_main_page.dart';
import 'package:mehers_kitchen/screens/category/detail_page.dart';

import 'package:mehers_kitchen/screens/signInscreens/signin_screen_page.dart';
import 'package:mehers_kitchen/screens/signUpscreens/signup_screen_page.dart';
import 'package:mehers_kitchen/widgets/detail_screen_widget.dart';

class AppNavigation {
  // ignore: body_might_complete_normally_nullable
  static Route? buildPage(RouteSettings settings) {
    switch (settings.name) {
      case SigninPage.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => const SigninPage(), settings: settings);
        }

      case SignupPage.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => const SignupPage(), settings: settings);
        }
      case HomeScreen.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => const HomeScreen(), settings: settings);
        }
      case DetailScreen.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => DetailScreen(), settings: settings);
        }

      default:
        {}
    }
  }
}
