import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/components/git_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/play_button.dart';

class ProjectsPage2 extends StatefulWidget {
  const ProjectsPage2({super.key});

  @override
  State<ProjectsPage2> createState() => _ProjectsPage2State();
}

class _ProjectsPage2State extends State<ProjectsPage2> {
  int _imageIndex = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      setState(() {
        _imageIndex = _imageIndex % 6 + 1;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Flexible(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'images/Evolucao_Screen_$_imageIndex.png',
                          width: constraints.maxWidth * 0.855,
                          height: constraints.maxHeight * 0.855,
                        ),
                        Image.asset('images/pixel_3.png'),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Evolução Médica',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'App para ajudar profissionais de saúde no acompanhamento de pacientes.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              GitButton(
                text: true,
                onPressed: () async {
                  const url =
                      'https://github.com/Danubio-Leite/evolucao_medica_2023';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not  launch $url';
                  }
                },
              ),
            ],
          ),
          Flexible(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'images/Calculadora_Screen_$_imageIndex.png',
                      width: constraints.maxWidth * 0.855,
                      height: constraints.maxHeight * 0.855,
                    ),
                    Image.asset('images/pixel_3.png'),
                  ],
                );
              },
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'images/Livros_Screen_$_imageIndex.png',
                            width: constraints.maxWidth * 0.855,
                            height: constraints.maxHeight * 0.855,
                          ),
                          Image.asset('images/pixel_3.png'),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Minha Biblioteca',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'App para gestão de coleções de livros.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                // GitButton(
                //   text: true,
                //   onPressed: () async {
                //     const url =
                //         'https://github.com/Danubio-Leite/private_library';
                //     if (await canLaunchUrl(Uri.parse(url))) {
                //       await launchUrl(Uri.parse(url));
                //     } else {
                //       throw 'Could not launch $url';
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
