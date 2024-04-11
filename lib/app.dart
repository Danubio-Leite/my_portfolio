import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:popover/popover.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'components/pop_contact_list.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/project_test.dart';
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
      title: 'Danúbio Leite',
      theme: ThemeData(
        fontFamily: 'Lekton',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          floatingActionButton: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.only(
                right: 12.0,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  showPopover(
                    context: context,
                    bodyBuilder: (context) => ListItems(
                      controller: controller,
                    ),
                    onPop: () => print('Popover was popped!'),
                    direction: PopoverDirection.left,
                    width: 400,
                    height: 300,
                    arrowHeight: 15,
                    arrowWidth: 30,
                  );
                },
                backgroundColor: const Color.fromARGB(255, 54, 84, 83),
                foregroundColor: Colors.white,
                child: const Icon(Icons.message),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 54, 84, 83),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 54, 84, 83),
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Sobre',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Projetos',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          3,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Contato',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
          body: ListView(
            controller: controller,
            children: [
              Card(
                  margin: const EdgeInsets.only(
                      bottom: 0, top: 0, right: 12, left: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const HomePage()),
              // Card(
              //     margin: const EdgeInsets.only(
              //         bottom: 0, top: 0, right: 12, left: 12),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(2),
              //     ),
              //     child: const AboutPage()),
              Card(
                  margin: const EdgeInsets.only(
                      bottom: 0, top: 0, right: 12, left: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const ProjectsPage()),
              Card(
                  margin: const EdgeInsets.only(
                      bottom: 0, top: 0, right: 12, left: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: ContactPage()),
            ],
          )

          // WebSmoothScroll(
          //   scrollOffset: 800,
          //   curve: Curves.easeInOut,
          //   controller: controller,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: PageView(
          //           scrollDirection: Axis.vertical,
          //           physics: const NeverScrollableScrollPhysics(),
          //           controller: controller,
          //           children: [
          //             Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(2),
          //                 ),
          //                 child: const HomePage()),
          //             Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(2),
          //                 ),
          //                 child: const AboutPage()),
          //             Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(2),
          //                 ),
          //                 child: const ProjectsPage()),
          //             Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(2),
          //                 ),
          //                 child: ContactPage()),
          //           ],
          //         ),
          //       ),
          //       SmoothPageIndicator(
          //         onDotClicked: (index) {
          //           controller.animateToPage(
          //             index,
          //             duration: const Duration(milliseconds: 500),
          //             curve: Curves.easeInOut,
          //           );
          //         },
          //         axisDirection: Axis.vertical,
          //         controller: controller,
          //         count: 4,
          //         effect: const ExpandingDotsEffect(
          //           activeDotColor: Colors.white,
          //           dotColor: Colors.white,
          //           dotHeight: 16,
          //           dotWidth: 16,
          //           spacing: 8,
          //         ),
          //       ),
          //       const SizedBox(width: 4),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
