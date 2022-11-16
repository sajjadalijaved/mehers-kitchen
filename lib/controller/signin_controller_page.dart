import 'package:flutter/material.dart';
import 'package:mehers_kitchen/bloc/signinbloc/sign_in_bloc.dart';
import 'package:mehers_kitchen/modelclasses/sign_in_user.dart';
import 'package:mehers_kitchen/screens/signUpscreens/signup_screen_page.dart';
import 'package:provider/provider.dart';

String? isValidEmail(String? email) {
  /*
     This fucntion validate email
   */
  if (email!.isEmpty) {
    return 'Please fill this field';
  } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return null;
  } else {
    return 'email is not valid';
  }
}

String? isValidPassword(String? password) {
  /*
     This fucntion validate password
   */
  if (password!.isEmpty) {
    return 'Please fill this field';
  } else if (password.length < 7) {
    return 'length should>=7';
  } else {
    return null;
  }
}

String? isValidName(String? name) {
  if (name!.isEmpty) {
    return 'Please fill this field';
  } else {
    return null;
  }
}

String? isValidLastName(String? lastname) {
  if (lastname!.isEmpty) {
    return 'Please fill this field';
  } else {
    return null;
  }
}

String? isValidPhoneNumber(String? phoneNumber) {
  if (phoneNumber!.isEmpty) {
    return 'must enter PhoneNumber';
  } else if (phoneNumber.length < 11) {
    return ' PhoneNumber length should be>=11 ';
  } else {
    return null;
  }
}

void btnSignin(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailGlobalKey,
    required TextEditingController passwordController,
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> passwordGlobalKey}) {
  SignInBloc signinBloc = Provider.of<SignInBloc>(context, listen: false);
  if (globalKey.currentState!.validate() &&
      emailGlobalKey.currentState!.validate() &&
      passwordGlobalKey.currentState!.validate()) {
    signinBloc.add(SignInSuccessfullyEvent(
        model: SignInUserModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )));
  }
}

void registerNowClick(BuildContext context) {
  Navigator.pushReplacementNamed(context, SignupPage.pageName);
}

// void googleSigninClick(BuildContext context) {
//   GoogleSignInBloc googleSignInBloc =
//       Provider.of<GoogleSignInBloc>(context, listen: false);
//   googleSignInBloc.add(SignInWithGoogleSuccessfullyEvent());
// }



// void forgotPasswordClick(BuildContext context) {
//   Navigator.pushNamed(context, ResetPasswordPage.pageName);
// }




