// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GitButton extends StatelessWidget {
  final VoidCallback onPressed;
  bool text;

  GitButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width < 600 ? 49 : 54,
      width: text ? (width < 600 ? 150 : 250) : (width < 600 ? 49 : 64),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/git.png', width: width < 600 ? 24 : 32),
              if (text == true) const SizedBox(width: 16),
              if (text == true)
                Text(
                  'Código do App',
                  style: TextStyle(
                      color: Colors.white, fontSize: width < 600 ? 14 : 18),
                ),
            ],
          )),
    );
  }
}
