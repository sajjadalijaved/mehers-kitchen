import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mehers_kitchen/screens/category/category_main_page.dart';
import 'package:mehers_kitchen/screens/signInscreens/signin_screen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? id;
  void getClientId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt('clientId');
  }

  @override
  void initState() {
    getClientId();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          if (id != null) {
            return const HomeScreen();
          } else {
            return const SigninPage();
          }
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: const Color(0Xff342b26),
        child: Center(
          child: Container(
            height: height * 0.4,
            width: width * 0.4,
            decoration: const BoxDecoration(
                color: Color(0Xff342b26), shape: BoxShape.circle),
            child: const Image(
              image: AssetImage('assets/splash_screen_lottie.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
