import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String masg;

  const CustomDialog({required this.masg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Text(masg),
      title: const Text('information'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('ok'))
      ],
    );
  }
}
