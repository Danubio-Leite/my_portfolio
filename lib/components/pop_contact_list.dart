import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  final ValueChanged<int> onMenuClick;
  final ScrollController controller;
  const ListItems(
      {Key? key, required this.controller, required this.onMenuClick})
      : super(key: key);

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
              ListTile(
                leading: const Icon(FontAwesomeIcons.commentDots),
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onMenuClick(2);
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  hoverColor: Colors.transparent,
                  child: const Text(
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
