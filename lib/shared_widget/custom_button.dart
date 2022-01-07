import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,required this.title,required this.onPressed}) : super(key: key);
  String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
      title,
      style: Theme.of(context).textTheme.button!.copyWith(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.button,
        ),
        minimumSize:
            MaterialStateProperty.all(
              Size(width-32, 54),
            ),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.red),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
