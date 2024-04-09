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
    return SizedBox(
      height: 64,
      width: text ? 250 : 64,
      child: Expanded(
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/git.png', width: 32),
                if (text == true) const SizedBox(width: 16),
                if (text == true)
                  const Text(
                    'Código do App',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
              ],
            )),
      ),
    );
    ;
  }
}
