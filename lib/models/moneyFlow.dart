import 'package:flutter/material.dart';

class MoneyFlow {
  final String id;
  final String title_flow;
  final double value;
  final DateTime dateTime;
  final String category;
  final bool entrance;

  MoneyFlow(this.title_flow, this.value, this.dateTime, this.category,
      this.entrance, this.id);

  String convertDateTime() {
    return this.dateTime.day.toString() +
        "-" +
        this.dateTime.month.toString() +
        "-" +
        this.dateTime.year.toString() +
        " " +
        this.dateTime.hour.toString() +
        ":" +
        this.dateTime.minute.toString();
  }
}

final MoneyFlow test = MoneyFlow("prova", -1.0, DateTime.tryParse("2022-01-27 13:27:00")!, "Pranzo", false, "id1");
final MoneyFlow test2 = MoneyFlow("prova2", -155.0, DateTime.tryParse("2022-12-22 13:27:00")!, "Pranzo", false, "id2");
final MoneyFlow test3 = MoneyFlow("prova3", 1.0, DateTime.tryParse("2022-12-21 13:27:00")!, "Pranzo", true, "id3");
final MoneyFlow test4 = MoneyFlow("prova4", 3.0, DateTime.now(), "Pranzo", true, "id4");

List<MoneyFlow> listFlows = [test, test2, test3, test4];

DateTime subDateGivenDate(DateTime date, String period) {
  Map<String, DateTime> periods = {
    "Today": DateTime(date.year, date.month, date.day),
    "Yesterday": DateTime(date.year, date.month, date.day-1),
    "Week": DateTime(date.year, date.month, date.day-7),
    "Month": DateTime(date.year, date.month-1, date.day),
    "Year": DateTime(date.year-1, date.month, date.day),
  };
  return periods[period]!;
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
