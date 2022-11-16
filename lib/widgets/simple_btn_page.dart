import 'package:flutter/material.dart';

// ignore: prefer_generic_function_type_aliases
typedef void SignInButtonClick({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required GlobalKey<FormFieldState> emailGlobalKey,
  required GlobalKey<FormFieldState> passwordGlobalKey,
  required GlobalKey<FormState> globalKey,
});

// ignore: prefer_generic_function_type_aliases
typedef void SignUpButtonClick(
    {required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController lastNameController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> emailValidationKey,
    required GlobalKey<FormFieldState> nameValidationKey,
    required GlobalKey<FormFieldState> lastNameValidationKey,
    required GlobalKey<FormFieldState> passwordValidationKey});

class SignupButton extends StatelessWidget {
  final double height;
  final double width;
  final GlobalKey<FormState> globalKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController lastNameController;

  final GlobalKey<FormFieldState> nameValidationKey;
  final GlobalKey<FormFieldState> emailValidationKey;
  final GlobalKey<FormFieldState> passwordValidationKey;
  final GlobalKey<FormFieldState> lastNameValidationKey;
  final SignUpButtonClick signupBtnClick;
  const SignupButton({
    Key? key,
    required this.signupBtnClick,
    required this.nameController,
    required this.globalKey,
    required this.passwordController,
    required this.emailController,
    required this.nameValidationKey,
    required this.emailValidationKey,
    required this.passwordValidationKey,
    required this.lastNameController,
    required this.lastNameValidationKey,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          signupBtnClick(
            context: context,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            lastNameController: lastNameController,
            globalKey: globalKey,
            nameValidationKey: nameValidationKey,
            emailValidationKey: emailValidationKey,
            passwordValidationKey: passwordValidationKey,
            lastNameValidationKey: lastNameValidationKey,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0Xffcaa21e),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text('SignUp',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormFieldState> emailGlobalKey;
  final GlobalKey<FormFieldState> passwordGlobalKey;
  final GlobalKey<FormState> globalKey;
  final SignInButtonClick signinBtnClick;

  const SigninButton(
      {required this.signinBtnClick,
      required this.emailController,
      required this.passwordController,
      required this.emailGlobalKey,
      required this.passwordGlobalKey,
      required this.text,
      required this.width,
      required this.height,
      Key? key,
      required this.globalKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          signinBtnClick(
              context: context,
              globalKey: globalKey,
              emailController: emailController,
              passwordController: passwordController,
              passwordGlobalKey: passwordGlobalKey,
              emailGlobalKey: emailGlobalKey);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0Xffcaa21e),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
