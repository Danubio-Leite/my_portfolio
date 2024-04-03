import 'package:flutter/material.dart';
import 'package:my_portfolio/components/git_button.dart';

import '../components/play_button.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                                  child: Image.asset('images/iphone_15.png')),
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
                                  child: Image.asset('images/iphone_15.png')),
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
                                    const Flexible(child: PlayButton()),
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
                                  child: Image.asset('images/iphone_15.png')),
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
