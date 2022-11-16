import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: prefer_generic_function_type_aliases
typedef void TextClick(BuildContext context);

class HaveAccount extends StatelessWidget {
  final double width;
  final double height;
  final String firstMsg;
  final String secondMsg;
  final TextClick textClick;

  const HaveAccount(
      {required this.textClick,
      required this.firstMsg,
      required this.secondMsg,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
          child: Text.rich(TextSpan(
              text: '$firstMsg ',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
              children: [
            TextSpan(
                text: secondMsg,
                style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decorationThickness: 1),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    textClick(context);
                  }),
          ]))),
    );
  }
}
