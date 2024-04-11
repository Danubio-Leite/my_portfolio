import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        width: width / 4,
        padding: EdgeInsets.only(
            left: width / 4,
            right: width / 4,
            top: width / 22,
            bottom: width / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/profile1.png',
              width: width / 4,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Danúbio Leite',
                    style: TextStyle(
                        fontSize: width / 45,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(69, 117, 116, 1)),
                  ),
                  Text(
                    'Desenvolvedor Mobile',
                    style: TextStyle(
                        fontSize: width / 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: width / 85,
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                'Há três anos venho desenvolvendo aplicações multiplataforma responsivas, intuitivas e com design moderno. Atualmente, trabalho na criação de aplicativos próprios e participo de projetos como freelancer. Precisa de ajuda para tirar sua ideia do papel? ',
                          ),
                          TextSpan(
                            text: 'Fale comigo!',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
