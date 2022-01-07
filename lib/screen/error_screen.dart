import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          "Error!\nSomething went wrong",
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.red,
              ),
        ),
      ),
    );
  }
}
