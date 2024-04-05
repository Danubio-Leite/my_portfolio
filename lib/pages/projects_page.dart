import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio/components/git_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/play_button.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Some Projects',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(69, 117, 116, 1),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Flexible(
                                child: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'images/screenshots/evolucao/Screen_$_imageIndex.png',
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
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'App to help doctors and patients.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              GitButton(
                                text: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            children: [
                              Flexible(
                                child: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'images/screenshots/calculadora/Screen_$_imageIndex.png',
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
                                'Calculadora do Bancário',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'App to help bank employees.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 300,
                                child: Row(
                                  children: [
                                    GitButton(text: false),
                                    const SizedBox(width: 8),
                                    Flexible(child: PlayButton(
                                      onPressed: () async {
                                        const url =
                                            'https://play.google.com/store/apps/details?id=br.com.danubioleite.calculadora_bancario';
                                        if (await canLaunchUrl(
                                            Uri.parse(url))) {
                                          await launchUrl(Uri.parse(url));
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            children: [
                              Flexible(
                                child: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'images/screenshots/livros/Screen_$_imageIndex.png',
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
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'App to help book lovers.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              GitButton(
                                text: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
