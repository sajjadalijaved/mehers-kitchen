import 'package:flutter/material.dart';

import 'package:mehers_kitchen/bloc/signupbloc/sign_up_bloc.dart';
import 'package:mehers_kitchen/modelclasses/sign_up.dart';
import 'package:mehers_kitchen/screens/signInscreens/signin_screen_page.dart';
import 'package:provider/provider.dart';

/*
   this is function is signin button
 */

void btnSignupClick(
    {required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController lastNameController,
    required GlobalKey<FormFieldState> lastNameValidationKey,
    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
    required TextEditingController passwordController,
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> passwordValidationKey}) {
  SignUpBloc bloc = Provider.of<SignUpBloc>(context, listen: false);
  if (globalKey.currentState!.validate() &&
      emailValidationKey.currentState!.validate() &&
      passwordValidationKey.currentState!.validate() &&
      nameValidationKey.currentState!.validate() &&
      lastNameValidationKey.currentState!.validate()) {
    bloc.add(SignUpSuccessfullyEvent(
        model: SignUpUserModel(
            displayName:
                nameController.text.trim() + lastNameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            loginBy: '1')));
  }
}

void signinClick(BuildContext context) {
  Navigator.pushNamed(context, SigninPage.pageName);
}
