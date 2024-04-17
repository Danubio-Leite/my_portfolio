import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'components/menu.dart';
import 'components/pop_contact_list.dart';
import 'pages/contact_page.dart';
import 'pages/home_page/home_mobile.dart';
import 'pages/home_page/home_page.dart';
import 'pages/home_page/home_web.dart';
import 'pages/projects_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scrollController = ScrollController();
  final keySecao1 = GlobalKey();
  final keySecao2 = GlobalKey();
  final keySecao3 = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600 ? true : false;

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
                bottom: 6.0,
              ),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  showPopover(
                    context: context,
                    bodyBuilder: (context) => ListItems(
                      onMenuClick: _onMenuClick,
                      controller: scrollController,
                    ),
                    onPop: () {},
                    direction:
                        mobile ? PopoverDirection.top : PopoverDirection.left,
                    width: mobile ? 300 : 400,
                    height: 300,
                    arrowHeight: mobile ? 10 : 15,
                    arrowWidth: mobile ? 20 : 30,
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
            title: Menu(
              onMenuClick: _onMenuClick,
            ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  child: mobile
                      ? HomeMobilePage(
                          onMenuClick: _onMenuClick,
                          key: keySecao1,
                        )
                      : HomeWebPage(
                          onMenuClick: _onMenuClick,
                          key: keySecao1,
                        ),
                ),
                ProjectsPage(
                  key: keySecao2,
                ),
                ContactPage(
                  key: keySecao3,
                ),
              ],
            ),
          )),
    );
  }

  void _onMenuClick(int index) {
    double width = MediaQuery.of(context).size.width;
    bool mobile = width < 600 ? true : false;
    Future<void> future = Future.value();
    switch (index) {
      case 0:
        future = Scrollable.ensureVisible(keySecao1.currentContext!,
            duration: const Duration(milliseconds: 600), curve: Curves.linear);
        break;
      case 1:
        future = Scrollable.ensureVisible(keySecao2.currentContext!,
            duration: const Duration(milliseconds: 600), curve: Curves.linear);
        break;
      case 2:
        future = Scrollable.ensureVisible(keySecao3.currentContext!,
            duration: const Duration(milliseconds: 600), curve: Curves.linear);
        break;
    }

    future.then((_) {
      final position = scrollController.position.pixels + (mobile ? 0 : 40);
      scrollController.animateTo(position,
          duration: const Duration(milliseconds: 600), curve: Curves.linear);
    });
  }
}
