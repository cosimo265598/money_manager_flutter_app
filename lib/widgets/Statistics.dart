import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int selectedIndex = 0;
  final List<String> timeSelector = ["Giorno", 'Settimana', 'Mese', 'Anno'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
        //topLeft: Radius.circular(38.0),
        //topRight: Radius.circular(38.0),
        ),
      ),

      height: 90.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: timeSelector.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  timeSelector[index],
                  style: TextStyle(
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.white60,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4),
                ),
              ),
            );
          }),
    );
  }
}
