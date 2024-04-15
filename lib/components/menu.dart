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
              child: HoverWidget(
                hoverChild: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                onHover: (_) {
                  // setState(() {
                  //   isHover = true;
                  // });
                },
                child: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(1),

              // controller.animateToPage(
              //   0,
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.easeInOut,
              // );
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              child: HoverWidget(
                hoverChild: const Text(
                  'Sobre',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                onHover: (_) {
                  // setState(() {
                  //   isHover = true;
                  // });
                },
                child: const Text(
                  'Sobre',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(1),
              // controller.animateToPage(
              //   0,
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.easeInOut,
              // );
            ),
            const SizedBox(width: 16),
            InkWell(
              child: HoverWidget(
                hoverChild: const Text(
                  'Projetos',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                onHover: (_) {
                  // setState(() {
                  //   isHover = true;
                  // });
                },
                child: const Text(
                  'Projetos',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () => onMenuClick(2),
              // controller.animateToPage(
              //   1,
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.easeInOut,
              // );
            ),
            const SizedBox(width: 16),
            InkWell(
              child: HoverWidget(
                hoverChild: const Text(
                  'Contato',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
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
              onTap: () => onMenuClick(3),
              // controller.animateToPage(
              //   2,
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.easeInOut,
              // );
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}
