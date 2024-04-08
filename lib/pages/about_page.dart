import 'package:auto_size_text/auto_size_text.dart';
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sobre Mim',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(69, 117, 116, 1),
                          ),
                        ),
                        SizedBox(height: 16),
                        Flexible(
                          child: AutoSizeText(
                            'Sempre em busca de novos conhecimentos, comecei a estudar Flutter 2 anos atrás e com ele tenho desenvolvido aplicações multiplataforma responsivas, intuitivas e com design moderno. Atualmente, estou estou trabalhando em aplicativos próprios e tenho participado de projetos como freelancer. Se você tiver alguma dúvida ou gostaria de trabalhar comigo, sinta-se à vontade para me contatar.',
                            style: TextStyle(fontSize: 18),
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
        ],
      ),
    );
  }
}
