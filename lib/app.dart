import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'components/menu.dart';
import 'components/pop_contact_list.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
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
                      onMenuClick: _onMenuClick,
                      controller: scrollController,
                    ),
                    onPop: () {},
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
            title: Menu(
              onMenuClick: _onMenuClick,
            ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                HomePage(
                  key: keySecao1,
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

  _onMenuClick(int value) {
    final RenderBox? renderBox;

    switch (value) {
      case 1:
        renderBox = keySecao1.currentContext?.findRenderObject() as RenderBox?;
        break;
      case 2:
        renderBox = keySecao2.currentContext?.findRenderObject() as RenderBox?;
        break;
      case 3:
        renderBox = keySecao3.currentContext?.findRenderObject() as RenderBox?;
        break;
      default:
        throw Exception();
    }

    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      scrollController.animateTo(
        offset.dy,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      print('RenderBox is null. The widget may not have been rendered yet.');
    }
  }

  // _onMenuClick(int value) {
  //   final RenderBox renderBox;

  //   switch (value) {
  //     case 1:
  //       renderBox = keySecao1.currentContext!.findRenderObject() as RenderBox;

  //       break;
  //     case 2:
  //       renderBox = keySecao2.currentContext!.findRenderObject() as RenderBox;
  //       break;
  //     case 3:
  //       renderBox = keySecao3.currentContext!.findRenderObject() as RenderBox;
  //       break;
  //     default:
  //       throw Exception();
  //   }
  //   final offset = renderBox.localToGlobal(Offset.zero);
  //   scrollController.animateTo(
  //     offset.dy,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }
}
