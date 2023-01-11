import 'package:flutter/material.dart';
import 'package:money_manger_app/widgets/AllFlows.dart';
import 'package:money_manger_app/widgets/OverallInOut.dart';
import 'package:money_manger_app/widgets/middlebar.dart';
import 'package:money_manger_app/widgets/recentflow.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}


class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AllFlows()
      ],
    );
  }
}