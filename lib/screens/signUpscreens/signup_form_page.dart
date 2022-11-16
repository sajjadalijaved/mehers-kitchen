import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mehers_kitchen/bloc/passwordvisiblebloc/password_field_bloc.dart';
import 'package:mehers_kitchen/controller/signin_controller_page.dart';
import 'package:mehers_kitchen/controller/signup_controller_page.dart';
import 'package:mehers_kitchen/widgets/already_haveaccount_page.dart';
import 'package:mehers_kitchen/widgets/simple_btn_page.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> lastNameGlobalKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordGlobalKey =
      GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> nameGlobalKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    PasswordFieldBloc passwordFieldBloc = Provider.of(context, listen: false);
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - 85;
    return Scaffold(
      backgroundColor: const Color(0Xff483d37),
      appBar: AppBar(
        backgroundColor: const Color(0Xff483d37),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.xmark,
            color: Color(0Xffcaa21e),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * .15,
                ),
                SizedBox(
                  height: height * .06,
                  child: const Center(
                    child: Text(
                      "Meher's Kitchen",
                      style: TextStyle(
                          color: Color(0Xffc8a21b),
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .10,
                  width: width,
                ),

                //Input field user name
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: Row(
                    children: [
                      SizedBox(
                        height: height,
                        width: width * .40,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          key: nameGlobalKey,
                          validator: isValidName,
                          onChanged: (value) {
                            nameGlobalKey.currentState!.validate();
                          },
                          controller: nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              FontAwesomeIcons.userTie,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'User Name',
                              style: TextStyle(color: Colors.white),
                            ),
                            hintText: 'please enter name',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(
                                color: Colors.black, fontSize: 16),
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
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .07,
                      ),
                      SizedBox(
                        height: height,
                        width: width * .40,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          key: lastNameGlobalKey,
                          validator: isValidLastName,
                          controller: lastNameController,
                          onChanged: (val) {
                            lastNameGlobalKey.currentState!.validate();
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            label: const Text('Last Name'),
                            hintText: 'please enter user last name',
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
                          ),
                        ),
                      ),
                      //Input Field Email
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    key: emailGlobalKey,
                    validator: isValidEmail,
                    controller: emailController,
                    onChanged: (val) {
                      emailGlobalKey.currentState!.validate();
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        FontAwesomeIcons.envelope,
                        color: Colors.white,
                      ),
                      label: const Text('Email Address'),
                      hintText: 'please enter email',
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
                    ),
                  ),
                ),
                // field lastname

                SizedBox(
                  height: height * .02,
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
                          key: passwordGlobalKey,
                          validator: isValidPassword,
                          onChanged: (value) {
                            passwordGlobalKey.currentState!.validate();
                          },
                          controller: passwordController,
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
                            ),
                          ),
                        );
                      } else {
                        return TextFormField(
                          obscuringCharacter: '*',
                          obscureText: true,
                          key: passwordGlobalKey,
                          validator: isValidPassword,
                          onChanged: (value) {
                            passwordGlobalKey.currentState!.validate();
                          },
                          controller: passwordController,
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
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                SignupButton(
                  signupBtnClick: btnSignupClick,
                  nameController: nameController,
                  passwordController: passwordController,
                  emailController: emailController,
                  nameValidationKey: nameGlobalKey,
                  emailValidationKey: emailGlobalKey,
                  passwordValidationKey: passwordGlobalKey,
                  lastNameController: lastNameController,
                  width: width * .50,
                  height: height * .07,
                  globalKey: globalKey,
                  lastNameValidationKey: lastNameGlobalKey,
                ),
                SizedBox(
                  height: height * .03,
                ),
                //Google Sign up Buitton

                HaveAccount(
                  firstMsg: 'Already have acount?',
                  secondMsg: 'Sign In',
                  textClick: signinClick,
                  width: width,
                  height: height * .03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
