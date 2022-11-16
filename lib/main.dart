import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/AddToCard/bloc/cart_bloc.dart';
import 'package:mehers_kitchen/bloc/confirmorderbloc/bloc/confirm_order_bloc.dart';
import 'package:mehers_kitchen/bloc/detailscreenbloc/detail_screen_add_to_cart_bloc.dart';

import 'package:mehers_kitchen/bloc/passwordvisiblebloc/password_field_bloc.dart';
import 'package:mehers_kitchen/bloc/productbyidbloc/product_by_id_bloc.dart';
import 'package:mehers_kitchen/bloc/signinbloc/sign_in_bloc.dart';

import 'package:mehers_kitchen/bloc/signupbloc/sign_up_bloc.dart';

import 'package:mehers_kitchen/routes/appnavigation_page.dart';
import 'package:mehers_kitchen/screens/category/bloc/product_itum_bloc.dart';

import 'package:mehers_kitchen/screens/splash_screen.dart';

import 'package:mehers_kitchen/tabsrepository/tabsbloc/bloc/tas_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
        BlocProvider<PasswordFieldBloc>(
          create: (context) => PasswordFieldBloc(),
        ),
        BlocProvider<DetailScreenAddToCartBloc>(
          create: (context) => DetailScreenAddToCartBloc(),
        ),
        BlocProvider<HomeScreenCategoryBloc>(
          create: (context) => HomeScreenCategoryBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<ProductItumBloc>(
          create: (context) => ProductItumBloc(),
        ),
        BlocProvider<HomeScreenProductBloc>(
          create: (context) => HomeScreenProductBloc(),
        ),
        BlocProvider<ConfirmOrderBloc>(
          create: (context) => ConfirmOrderBloc(),
        ),
      ],
      child: const MaterialApp(
          title: "Meher's Kitchen",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppNavigation.buildPage,
          home: SplashScreen()),
    );
  }
}
