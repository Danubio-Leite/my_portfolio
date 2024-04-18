import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  final String appName;
  final String appDescription;
  final String image;
  final Widget? buttons;
  const ProjectItem(
      {super.key,
      required this.appName,
      required this.appDescription,
      required this.image,
      this.buttons});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
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
          Text(
            appName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            appDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          if (buttons != null) buttons!,
        ],
      ),
    );
  }
}
