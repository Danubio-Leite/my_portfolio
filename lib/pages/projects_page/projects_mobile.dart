import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/components/git_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/play_button.dart';

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
                          const SizedBox(height: 14),
                          const Text(
                            'Calculadora do Bancário',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'App direcionado para funcionários de bancos e instituições financeiras.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            width: 300,
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
                        ],
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
