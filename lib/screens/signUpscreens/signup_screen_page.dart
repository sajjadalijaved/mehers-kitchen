import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mehers_kitchen/bloc/signupbloc/sign_up_bloc.dart';

import 'package:mehers_kitchen/screens/category/category_main_page.dart';
import 'package:mehers_kitchen/screens/signUpscreens/signup_form_page.dart';
import 'package:mehers_kitchen/widgets/dialog_page.dart';

class SignupPage extends StatelessWidget {
  static const String pageName = 'signuppage';

  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          const SignupForm(),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is SignUpInitial) {
                return const SizedBox();
              } else if (state is SignUpLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 3,
                  ),
                );
              } else if (state is SignUpSuccessfullyState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Your Success fully SignUp"),
                    ),
                  );
                });
                return const SizedBox();
              } else if (state is SignUpErrorState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(masg: state.error));
                });
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    ));
  }
}
