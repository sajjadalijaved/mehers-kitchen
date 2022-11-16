import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/bloc/signinbloc/sign_in_bloc.dart';
import 'package:mehers_kitchen/screens/category/category_main_page.dart';

import 'package:mehers_kitchen/screens/signInscreens/signin_form_page.dart';
import 'package:mehers_kitchen/widgets/dialog_page.dart';

class SigninPage extends StatelessWidget {
  static const String pageName = 'signinpage';

  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ScaffoldPage());
  }
}

class ScaffoldPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordGlobalKey =
      GlobalKey<FormFieldState>();
  ScaffoldPage({Key? key}) : super(key: key);
////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff342b26),
      body: Stack(
        children: [
          SigninForm(
            emailController: emailController,
            passwordController: passwordController,
            emailGlobalKey: emailGlobalKey,
            passwordGlobalKey: passwordGlobalKey,
            globalKey: globalKey,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInInitial) {
                return const SizedBox();
              } else if (state is SignInLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SignInSuccessfullyState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.pushReplacementNamed(context, HomeScreen.pageName,
                      arguments: null);
                });
                return const SizedBox();
              } else if (state is SignInFailedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(masg: state.message));
                });
                return const SizedBox();
              } else if (state is SignInWithGoogleSuccessfullyState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.pushReplacementNamed(context, HomeScreen.pageName,
                      arguments: null);
                });
                return const SizedBox();
              } else if (state is SignInWithGoogleFailedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(masg: state.message));
                });
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
