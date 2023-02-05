import 'package:flutter/material.dart';
import 'package:fluttercore/core/utils/translation.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var currentScreen = 0;

  List<Widget> get screens {
    return <Widget>[
      Center(
        child: Text(context.text.home),
      ),
      Center(
        child: Text(context.text.notification),
      ),
      Center(
        child: Text(context.text.profile),
      ),
    ];
  }

  List<BottomNavigationBarItem> get bottomNavBarItem {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(Icons.home), label: context.text.home),
      BottomNavigationBarItem(
          icon: const Icon(Icons.notifications),
          label: context.text.notification),
      BottomNavigationBarItem(
          icon: const Icon(Icons.person), label: context.text.profile),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreen,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItem,
        currentIndex: currentScreen,
        onTap: (index) => setState(() => currentScreen = index),
      ),
    );
  }
}
