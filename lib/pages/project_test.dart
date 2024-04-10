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
          Image.asset(
            'images/Calculadora_Screen_1.png',
            width: 200,
            height: 400,
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
          Image.asset(
            'images/Evolucao_Screen_1.png',
            width: 200,
            height: 400,
          ),
        ],
      ),
    );
  }
}
