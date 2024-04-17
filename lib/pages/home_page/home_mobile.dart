import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeMobilePage extends StatelessWidget {
  final ValueChanged<int> onMenuClick;
  const HomeMobilePage({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(250, 250, 250, 1),
                Color.fromRGBO(245, 245, 245, 1),
                Color.fromRGBO(240, 240, 240, 1),
                Color.fromRGBO(235, 235, 235, 1),
                Color.fromRGBO(230, 230, 230, 1),
                Color.fromRGBO(225, 225, 225, 1),
              ]),
        ),
        // color: Colors.white,
        height: MediaQuery.of(context).size.height - 40,
        child: Container(
          width: width,
          padding: EdgeInsets.only(
            left: width / 10,
            right: width / 10,
            top: width / 22,
            bottom: width / 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36.0, bottom: 60.0),
                child: Image.asset(
                  'images/profile1.png',
                  width: width / 2,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Danúbio Leite',
                      style: TextStyle(
                          fontFamily: 'Miriam Libre',
                          fontSize: width / 14,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(69, 117, 116, 1)),
                    ),
                    Text(
                      'Desenvolvedor Mobile',
                      style: TextStyle(
                          fontSize: width / 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: width / 30,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              style: TextStyle(
                                fontFamily: 'Lekton',
                              ),
                              text:
                                  'Desenvolvo aplicações multiplataforma responsivas, intuitivas e com design moderno. Atualmente, trabalho na criação de aplicativos próprios e participo de projetos como freelancer. Precisa de ajuda para tirar sua ideia do papel? ',
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  onMenuClick(2);
                                },
                              text: 'Fale comigo!',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
