import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomePage(
            onProfile: () => _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.ease),
          ),
          ProfilePage(
            onHome: () => _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.ease),
          ),
        ],
      ),
    );
  }
}
