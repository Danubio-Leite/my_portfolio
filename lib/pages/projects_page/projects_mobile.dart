import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/components/git_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/play_button.dart';
import '../../components/project_item.dart';

class ProjectsMobilePage extends StatefulWidget {
  const ProjectsMobilePage({
    super.key,
  });

  @override
  State<ProjectsMobilePage> createState() => _ProjectsMobilePageState();
}

class _ProjectsMobilePageState extends State<ProjectsMobilePage> {
  int _imageIndex = 1;
  late Timer _timer;
  PageController _pageController = PageController();
  late List<Widget> projectItems;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      setState(() {
        _imageIndex = _imageIndex % 6 + 1;
      });
    });
    projectItems = [
      ProjectItem(
        appName: 'Calculadora do Bancário',
        appDescription:
            'App direcionado para funcionários de bancos e instituições financeiras.',
        image: 'images/Calculadora_Screen_$_imageIndex.png',
        buttons: SizedBox(
          width: 200,
          child: Row(
            children: [
              GitButton(
                text: false,
                onPressed: () async {
                  const url =
                      'https://github.com/Danubio-Leite/calculadora_bancario';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              const SizedBox(width: 8),
              Flexible(
                child: PlayButton(
                  onPressed: () async {
                    const url =
                        'https://play.google.com/store/apps/details?id=br.com.danubioleite.calculadora_bancario';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      ProjectItem(
        appName: 'Evolução Médica',
        appDescription:
            'App para ajudar profissionais de saúde no acompanhamento de pacientes.',
        image: 'images/Evolucao_Screen_$_imageIndex.png',
        buttons: GitButton(
          text: true,
          onPressed: () async {
            const url = 'https://github.com/Danubio-Leite/evolucao_medica_2023';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            } else {
              throw 'Could not  launch $url';
            }
          },
        ),
      ),
      ProjectItem(
        appName: 'Minha Biblioteca',
        appDescription: 'App para gestão de coleções de livros.',
        image: 'images/Livros_Screen_$_imageIndex.png',
        buttons: GitButton(
          text: true,
          onPressed: () async {
            const url = 'https://github.com/Danubio-Leite/private_library';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ),
    ];
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
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
        height: MediaQuery.of(context).size.height - 40,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Alguns Projetos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(69, 117, 116, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: projectItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: projectItems[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
