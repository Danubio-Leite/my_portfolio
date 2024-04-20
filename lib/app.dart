import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'components/menu.dart';
import 'components/pop_contact_list.dart';
import 'pages/contact_page.dart';
import 'pages/contact_page/contact_mobile.dart';
import 'pages/contact_page/contact_web.dart';
import 'pages/home_page/home_mobile.dart';
import 'pages/home_page.dart';
import 'pages/home_page/home_web.dart';
import 'pages/projects_page.dart';
import 'pages/projects_page/projects_mobile.dart';
import 'pages/projects_page/projects_web.dart';

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
  final ValueNotifier<bool> showButton = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    var isShow =
        scrollController.offset < keySecao3.currentContext!.size!.height;
    if (isShow != showButton.value) {
      showButton.value = isShow;
    }
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
          floatingActionButton: ValueListenableBuilder<bool>(
            valueListenable: showButton,
            builder: (context, value, child) {
              return value
                  ? Builder(
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
                              direction: mobile
                                  ? PopoverDirection.top
                                  : PopoverDirection.left,
                              width: mobile ? 300 : 400,
                              height: 300,
                              arrowHeight: mobile ? 10 : 15,
                              arrowWidth: mobile ? 20 : 30,
                            );
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 54, 84, 83),
                          foregroundColor: Colors.white,
                          child: const Icon(Icons.message),
                        ),
                      ),
                    )
                  : Container();
            },
          ),
          backgroundColor: const Color.fromARGB(255, 54, 84, 83),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 54, 84, 83),
              elevation: 0,
              scrolledUnderElevation: 0,
              title: Menu(
                onMenuClick: _onMenuClick,
              ),
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
                Container(
                  child: mobile
                      ? ProjectsMobilePage(
                          key: keySecao2,
                        )
                      : ProjectsWebPage(
                          key: keySecao2,
                        ),
                ),
                Container(
                  child: mobile
                      ? ContactMobilePage(
                          key: keySecao3,
                        )
                      : ContactWebPage(
                          key: keySecao3,
                        ),
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
      final position = scrollController.position.pixels;
      // final position = scrollController.position.pixels + (mobile ? 0 : 40);
      scrollController.animateTo(position,
          duration: const Duration(milliseconds: 700), curve: Curves.linear);
    });
  }
}
