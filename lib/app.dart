import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about_page.dart';
import 'package:my_portfolio/pages/contact_page.dart';
import 'package:my_portfolio/pages/projects_page.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Column(
          children: [
            const Row(
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
            Expanded(
              child: ListView(
                children: const [
                  HomePage(),
                  AboutPage(),
                  ProjectsPage(),
                  ContactPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
