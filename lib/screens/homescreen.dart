import 'package:flutter/material.dart';
import 'package:money_manger_app/widgets/AddTransaction.dart';
import 'package:money_manger_app/widgets/Settings.dart';

import 'package:money_manger_app/widgets/Statisticspage.dart';

import 'package:money_manger_app/widgets/history.dart';
import 'package:money_manger_app/widgets/home.dart';

import 'package:money_manger_app/widgets/topbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> pages = [
    Home(),
    History(),
    AddTransaction(), // add transaction pages
    Statisticspage(),// statistics
    Settings(),// settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: TopBar(),
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          //indicatorColor: Colors.lightBlue[200],

        ),
        child: NavigationBar(

          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 900),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 70,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Icons.history_rounded,
                  size: 30,
                ),
                label: 'History'),
            NavigationDestination(

                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 50,color: Colors.amber,
                ),
                label: "Add"),
            NavigationDestination(
                icon: Icon(
                  Icons.stacked_bar_chart_rounded,
                  size: 30,
                ),
                label: "Statistics"),
            NavigationDestination(
                icon: Icon(
                  Icons.settings_rounded,
                  size: 30,
                ),
                label: "Settings")
          ],
        ),
      ),
    );
  }
}
