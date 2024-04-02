import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'About Me',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'I am passionate about mobile technologies and I am always eager to learn new things. I have been working with Flutter for the past 2 years and I have built a few apps with it. I am also a big fan of open-source software and I love to contribute to the community. I am currently looking for new opportunities to work on exciting projects. If you have any questions or would like to work with me, feel free to contact me.',
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
        ],
      ),
    );
  }
}
