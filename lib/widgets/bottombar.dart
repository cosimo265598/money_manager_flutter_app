import 'package:flutter/material.dart';
import 'package:money_manger_app/screens/StatScreen.dart';
import 'package:money_manger_app/screens/homescreen.dart';
import 'package:money_manger_app/screens/historyscreen.dart';
import 'package:money_manger_app/widgets/middlebar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.blueGrey,
      elevation: 10,
      onTap: (value) {
        switch(value){
          case 0:{
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
          }break;
          case 1:{
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen()),);
          }break;

          case 3:{
            Navigator.push(context, MaterialPageRoute(builder: (context) => const StatScreen()),);
          }break;
        }

      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 30,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.history_outlined,
              size: 30,
            ),
            label: "History"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_rounded,
              size: 30,
            ),
            label: "Add"),
        BottomNavigationBarItem(icon: Icon(
          Icons.stacked_bar_chart_rounded,
          size: 30,
        ),
            label: "Statistics"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
              size: 30,
            ),
            label: "Settings")
      ],
    );
  }
}
