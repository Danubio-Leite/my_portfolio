import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home_page/home_mobile.dart';
import 'home_page/home_web.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<int> onMenuClick;
  const HomePage({Key? key, required this.onMenuClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: width > 600
          ? HomeWebPage(onMenuClick: onMenuClick)
          : HomeMobilePage(onMenuClick: onMenuClick),
    );
  }
}
