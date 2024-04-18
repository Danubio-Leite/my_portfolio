import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final void Function() onPressed;
  const PlayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width < 600 ? 49 : 54,
      width: width < 600 ? 150 : 300,
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
              Image.asset(
                'images/play.png',
                width: width < 600 ? 24 : 32,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    'Android App on',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width < 600 ? 10 : 11,
                    ),
                  ),
                  Text(
                    'Google Play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width < 600 ? 13 : 15,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
