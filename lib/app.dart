import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Text('Home'),
                ],
              ),
              Row(
                children: [
                  Text('About'),
                  SizedBox(width: 16),
                  Text('Projects'),
                  SizedBox(width: 16),
                  Text('Contact'),
                  SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
        body: WebSmoothScroll(
          scrollOffset: 800,
          curve: Curves.easeInOut,
          controller: controller,
          child: Row(
            children: [
              Expanded(
                child: PageView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: const [
                    HomePage(),
                    AboutPage(),
                    ProjectsPage(),
                    ContactPage(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                onDotClicked: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                axisDirection: Axis.vertical,
                controller: controller,
                count: 4,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                  dotHeight: 16,
                  dotWidth: 16,
                  spacing: 8,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
