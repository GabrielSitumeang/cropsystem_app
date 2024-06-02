import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa3/pages/budidaya_page.dart';
import 'package:pa3/pages/home_page.dart';
import 'package:pa3/pages/komunitas/komunitas_page.dart';
import 'package:pa3/pages/profile_page.dart';
import 'package:pa3/pages/catatan/index_catatan_page.dart';

class NavPageLoginScreen extends StatelessWidget {
  NavPageLoginScreen({super.key});
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Curved Nav'),
        //   backgroundColor: const Color.fromARGB(255, 255, 240, 219),
        //   foregroundColor: Colors.black,
        // ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[HomePage(), KomunitasPage(), ProfilePage(), const IndexCatatan()],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.green,
          buttonBackgroundColor: Colors.white,
          color: Color.fromARGB(255, 255, 251, 244),
          height: 65,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 35,
              color: Colors.black,
            ),
            Icon(
              Icons.group,
              size: 35,
              color: Colors.black,
            ),
            Icon(
              Icons.person,
              size: 35,
              color: Colors.black,
            ),
          ],
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
          },
        ),
      ),
    );
  }
}
