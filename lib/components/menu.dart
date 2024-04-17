import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class Menu extends StatelessWidget {
  final ValueChanged<int> onMenuClick;
  const Menu({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              hoverColor: Colors.transparent,
              child: HoverWidget(
                hoverChild: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 139, 209, 200),
                  ),
                ),
                onHover: (_) {},
                child: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(0),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              hoverColor: Colors.transparent,
              child: HoverWidget(
                hoverChild: const Text(
                  'Sobre',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 139, 209, 200),
                  ),
                ),
                onHover: (_) {},
                child: const Text(
                  'Sobre',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(0),
            ),
            const SizedBox(width: 16),
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              hoverColor: Colors.transparent,
              child: HoverWidget(
                hoverChild: const Text(
                  'Projetos',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 139, 209, 200),
                  ),
                ),
                onHover: (_) {},
                child: const Text(
                  'Projetos',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(1),
            ),
            const SizedBox(width: 16),
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              hoverColor: Colors.transparent,
              child: HoverWidget(
                hoverChild: const Text(
                  'Contato',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 139, 209, 200),
                  ),
                ),
                onHover: (_) {
                  // setState(() {
                  //   isHover = true;
                  // });
                },
                child: const Text(
                  'Contato',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(2),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}
