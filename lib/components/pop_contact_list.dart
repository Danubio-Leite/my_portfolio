import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItems extends StatelessWidget {
  final PageController controller;
  const ListItems({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Center(
          child: Text(
            'Vamos conversar sobre seu projeto?',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(69, 117, 116, 1)),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.whatsapp),
                    title: Text('Whatsapp'),
                    subtitle: SelectableText('+55 88 98155-1948'),
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.envelope),
                    title: Text('E-mail'),
                    subtitle: SelectableText('danubioalves@gmail.com'),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  controller.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                },
                child: const ListTile(
                  leading: Icon(FontAwesomeIcons.commentDots),
                  title: Text(
                    'Enviar Mensagem',
                    style: TextStyle(
                        color: Color.fromRGBO(69, 117, 116, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
