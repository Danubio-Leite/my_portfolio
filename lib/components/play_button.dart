import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final void Function() onPressed;
  const PlayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 300,
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
              Image.asset('images/play.png', width: 32),
              const SizedBox(width: 24),
              const Column(
                children: [
                  Text(
                    'Android App on',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Google Play',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
