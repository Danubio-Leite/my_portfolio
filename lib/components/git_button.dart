// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GitButton extends StatelessWidget {
  bool text;

  GitButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: text ? 250 : 64,
      child: Expanded(
        child: ElevatedButton(
            onPressed: () {},
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
                Image.asset('images/icons/git.png', width: 32),
                if (text == true) const SizedBox(width: 16),
                if (text == true)
                  const Text(
                    'App Code',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
              ],
            )),
      ),
    );
    ;
  }
}
