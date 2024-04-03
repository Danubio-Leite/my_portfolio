import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile Developer',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Hi, my name is Danubio. I\'m passionate about tech and a mobile developer specializing in Flutter.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Flexible(child: Image.asset('images/profile1.png')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
