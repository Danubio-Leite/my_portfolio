import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        width: _width / 4,
        padding: EdgeInsets.only(
            left: _width / 4,
            right: _width / 4,
            top: _width / 22,
            bottom: _width / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/profile1.png',
              width: _width / 4,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Danúbio Leite',
                    style: TextStyle(
                        fontSize: _width / 45,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(69, 117, 116, 1)),
                  ),
                  Text(
                    'Desenvolvedor Mobile',
                    style: TextStyle(
                        fontSize: _width / 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: _width / 85,
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                              text:
                                  'Sempre em busca de novos conhecimentos, comecei a estudar Flutter três anos atrás e com ele tenho desenvolvido aplicações multiplataforma responsivas, intuitivas e com design moderno. Atualmente, estou estou trabalhando em aplicativos próprios e tenho participado de projetos como freelancer. Se você tiver alguma dúvida ou gostaria de trabalhar comigo, sinta-se à vontade para me contatar.'),
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
