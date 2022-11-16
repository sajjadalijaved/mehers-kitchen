import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mehers_kitchen/bloc/passwordvisiblebloc/password_field_bloc.dart';
import 'package:mehers_kitchen/bloc/signinbloc/sign_in_bloc.dart';
import 'package:mehers_kitchen/bloc/signupbloc/sign_up_bloc.dart';
import 'package:mehers_kitchen/controller/signin_controller_page.dart';

import 'package:mehers_kitchen/modelclasses/sign_in_with_google.dart';

import 'package:mehers_kitchen/screens/category/category_main_page.dart';

import 'package:mehers_kitchen/widgets/already_haveaccount_page.dart';
import 'package:mehers_kitchen/widgets/simple_btn_page.dart';
import 'package:provider/provider.dart';

class SigninForm extends StatefulWidget {
  final TextEditingController emailController;
  final GlobalKey<FormFieldState> emailGlobalKey;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  final GlobalKey<FormFieldState> passwordGlobalKey;

  const SigninForm(
      {Key? key,
      required this.passwordController,
      required this.emailController,
      required this.emailGlobalKey,
      required this.passwordGlobalKey,
      required this.globalKey})
      : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  @override
  Widget build(BuildContext context) {
    PasswordFieldBloc passwordFieldBloc =
        Provider.of<PasswordFieldBloc>(context, listen: false);
    final signInBloc = Provider.of<SignInBloc>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - 85;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: widget.globalKey,
          child: Column(
            children: [
              SizedBox(height: height * .05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                    height: height * .08,
                    width: width,
                    child: const Center(
                      child: Text(
                        "Meher's Kitchen",
                        style: TextStyle(
                            color: Color(0Xffcba01b),
                            fontSize: 30.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900),
                      ),
                    )),
              ),
              SizedBox(
                height: height * .12,
                width: width,
              ),

              SizedBox(
                height: height * .01,
              ),
              //Input Field Email
              SizedBox(
                height: height * .10,
                width: width,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: widget.emailGlobalKey,
                  validator: isValidEmail,
                  onChanged: (value) {
                    widget.emailGlobalKey.currentState!.validate();
                  },
                  controller: widget.emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      label: const Text('User Email'),
                      hintText: 'Email or username',
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                          width: 2,
                        ),
                      )),
                ),
              ),

              SizedBox(
                height: height * .01,
              ),
              //Input field Password
              SizedBox(
                height: height * .10,
                width: width,
                child: BlocBuilder<PasswordFieldBloc, PasswordFieldState>(
                  builder: (context, state) {
                    if (state is PasswordVisibilitState) {
                      return TextFormField(
                        obscuringCharacter: '*',
                        obscureText: state.obscure,
                        key: widget.passwordGlobalKey,
                        validator: isValidPassword,
                        onChanged: (value) {
                          widget.passwordGlobalKey.currentState!.validate();
                        },
                        controller: widget.passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.https_outlined,
                            color: Colors.white,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (state.obscure) {
                                passwordFieldBloc
                                    .add(const VisibilityChangeEvent(false));
                              } else {
                                passwordFieldBloc
                                    .add(const VisibilityChangeEvent(true));
                              }
                            },
                            child: Icon(
                              state.obscure
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.white,
                            ),
                          ),
                          label: const Text('User Password'),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return TextFormField(
                        obscuringCharacter: '*',
                        obscureText: true,
                        key: widget.passwordGlobalKey,
                        validator: isValidPassword,
                        onChanged: (value) {
                          widget.passwordGlobalKey.currentState!.validate();
                        },
                        controller: widget.passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.https_outlined,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                passwordFieldBloc
                                    .add(const VisibilityChangeEvent(false));
                              },
                              child: const Icon(
                                Icons.visibility_off_rounded,
                                color: Colors.white,
                              ),
                            ),
                            label: const Text('User Password'),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),

              SizedBox(
                height: height * .07,
              ),

              SigninButton(
                  signinBtnClick: btnSignin,
                  emailController: widget.emailController,
                  passwordController: widget.passwordController,
                  emailGlobalKey: widget.emailGlobalKey,
                  passwordGlobalKey: widget.passwordGlobalKey,
                  text: 'SIGN IN',
                  width: width * .50,
                  height: height * .06,
                  globalKey: widget.globalKey),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: height * .03,
                  width: width,
                  child: Row(
                    children: const [
                      Flexible(
                        flex: 10,
                        child: Center(
                          child: Text(
                            " _______________",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 05,
                        child: Center(
                          child: Text(
                            " Or",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: Center(
                          child: Text(
                            " _______________",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              SizedBox(
                height: height * .06,
                width: width,
                child: GestureDetector(
                  onTap: () {
                    signInBloc.add(
                      SignInWithGoogleEvent(
                        signInWithGoogleModel:
                            SignInWithGoogleModel(loginBy: '2'),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0Xffcaa21e),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: height * .03,
                  width: width,
                  child: Row(
                    children: const [
                      Flexible(
                        flex: 10,
                        child: Center(
                          child: Text(
                            " _______________",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 05,
                        child: Center(
                          child: Text(
                            " Or",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: Center(
                          child: Text(
                            " _______________",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              SizedBox(
                height: height * .06,
                width: width * .50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomeScreen.pageName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0Xffcaa21e),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text("GUEST",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              HaveAccount(
                textClick: registerNowClick,
                firstMsg: 'Don\'t have an account?',
                secondMsg: 'Sign Up',
                height: height * .03,
                width: width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
