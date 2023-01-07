import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';


part 'moneyFlow.g.dart';

@HiveType(typeId: 1)
class MoneyFlow {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title_flow;
  @HiveField(2)
  final double value;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final bool entrance;

  MoneyFlow(this.title_flow, this.value, this.dateTime, this.category,
      this.entrance, this.id);

  String convertDateTime() {
    return DateFormat('d MMM y').format(this.dateTime);
  }
}

List<MoneyFlow> generateRandomData(DateTime start){
  List<MoneyFlow> transactions = [];
  for (int i=0; i< 50 ;i ++ )
    {
      int r=Random.secure().nextInt(365);
      transactions.add(MoneyFlow(i.toString(),r.toDouble(),start.add(Duration(days: r)), "Pranzo", false, i.toString()));
    }
  return transactions;
}

final MoneyFlow test = MoneyFlow("prova", -1.0, DateTime.tryParse("2022-01-27 13:27:00")!, "Pranzo", false, "id1");
final MoneyFlow test2 = MoneyFlow("prova2", -155.0, DateTime.tryParse("2022-12-22 13:27:00")!, "Pranzo", false, "id2");
final MoneyFlow test3 = MoneyFlow("prova3", 1.0, DateTime.tryParse("2022-12-21 13:27:00")!, "Pranzo", true, "id3");
final MoneyFlow test4 = MoneyFlow("prova4", 3.0, DateTime.now(), "Pranzo", true, "id4");

//List<MoneyFlow> listFlows = [test, test2, test3, test4];
List<MoneyFlow> listFlows = generateRandomData(DateTime.tryParse("2022-01-01 13:27:00")!);

DateTime subDateGivenDateFineGrane(DateTime date, String period) {
  Map<String, DateTime> periods = {
    "Today": DateTime(date.year, date.month, date.day),
    "Yesterday": DateTime(date.year, date.month, date.day).subtract(Duration(days: 1)),
    "Last Week": DateTime(date.year, date.month, date.day).subtract(Duration(days: 7)),
    "Last Month": DateTime(date.year, date.month-1, date.day),
    "Last 3 Month": DateTime(date.year, date.month-3, date.day),
    "Last 6 Month": DateTime(date.year, date.month-6, date.day),
    "Last Year": DateTime(date.year-1, date.month, date.day),
  };
  return periods[period]!;
}

DateTime subDateGivenDate(DateTime date, String period) {
  Map<String, DateTime> periods = {
    "Today": DateTime(date.year, date.month, date.day),
    "Yesterday": DateTime(date.year, date.month, date.day),
    "Week": DateTime(date.year, date.month-1, date.day),
    "Month": DateTime(date.year, date.month-1, date.day),
    "Year": DateTime(date.year-1, date.month, date.day),
  };
  return periods[period]!;
}

List<MoneyFlow> retriveTransactionStartFromDate(String period){
  List<MoneyFlow> transactions = [];
  listFlows.forEach((element) {
    if(element.dateTime.isAfter(subDateGivenDate(DateTime.now(), period))){
      transactions.add(element);
    }
  });
  transactions.forEach((element) {print(element.title_flow);});
  return transactions;
}

Map<String, double> retriveStatsFromDataFlows(
    List<MoneyFlow> listFlows, String period) {
  print(period);

  double income = 0;
  double outcome = 0;

  listFlows.forEach((element) {
    if (element.dateTime.isAfter(subDateGivenDate(DateTime.now(), period)))
      if (element.entrance)
        income = income + element.value;
      else
        outcome = outcome + element.value;
  });
  Map<String, double> toRet = {
    "Income": income,
    "Outcome": outcome.abs(),
  };
  print(toRet);
  return toRet;
}
