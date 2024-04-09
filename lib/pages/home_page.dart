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
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Olá!',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(69, 117, 116, 1)),
                          ),
                          const SizedBox(height: 16),
                          Flexible(
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Me chamo Danúbio. Sou apaixonado por tecnologia e '),
                                  TextSpan(
                                      text: 'Desenvolvedor Mobile',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(69, 117, 116, 1))),
                                  TextSpan(text: ' especializado em Flutter.'),
                                ],
                              ),
                            ),
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
