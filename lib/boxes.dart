import 'dart:math';

import 'package:hive/hive.dart';
import 'package:money_manger_app/models/ChartData.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:money_manger_app/models/user.dart';
import 'package:money_manger_app/widgets/StackedColumns.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Boxes {
  static Box<User> getConfigUser() => Hive.box<User>("user");
  static User? getConfigUserLocal() => Hive.box<User>("user").get("localUser");
  static Future<void> setConfigUserLocal(User user) =>
      Hive.box<User>("user").put("localUser", user);

  static Box<MoneyFlow> getTransactions() =>
      Hive.box<MoneyFlow>("transactions");
  static Future<void> addTransactions(String uuid, MoneyFlow m) =>
      Hive.box<MoneyFlow>("transactions").put(uuid, m);
  static List<MoneyFlow> getRecentTransactions(int n_max) {
    List<MoneyFlow> t = getTransactions().values.toList();
    t.sort((a, b) => -a.dateTime.compareTo(b.dateTime));
    t.take(n_max);
    print(t.length);
    return t;
  }

  static List<double> getTransactionsIncomeAndExpense(DateTime d) {
    List<double> in_ex = [];
    try {
      double _income = getTransactions()
          .values
          .where((element) =>
              element.dateTime.isAfter(d) && element.entrance == true)
          .map((e) => e.value)
          .reduce((sum, element) => sum + element);
      in_ex.add(_income);
    } catch (e) {
      in_ex.add(0);
    }
    try {
      double _expense = getTransactions()
          .values
          .where((element) =>
              element.dateTime.isAfter(d) && element.entrance == false)
          .map((e) => e.value)
          .reduce((sum, element) => sum + element);
      in_ex.add(_expense);
    } catch (e) {
      in_ex.add(0);
    }
    return in_ex;
  }

  static List<MoneyFlow> getTransactionsGivenDate(DateTime d) {
    return getTransactions()
        .values
        .where((element) => element.dateTime.isAfter(d))
        .toList();
  }

  static List<ChartData> getAmountGivenDateRadial(String period, String category) {
    DateTime d = subDateGivenDateFineGrane(DateTime.now(),period);
    List<ChartData> t=[];
    try {
      t.add(ChartData("Income", getTransactions()
          .values
          .where((element) => element.dateTime.isAfter(d))
          .where((element) => element.category.compareTo(category) == 0)
          .where((element) => element.entrance == true)
          .map((e) => e.value).reduce((sum, element) => sum + element).truncateToDouble(), 0
      ));
    }catch(e){
      t.add(ChartData("Income",0,0 ));
    }
    try {
      t.add(ChartData("Expense", getTransactions()
          .values
          .where((element) => element.dateTime.isAfter(d))
          .where((element) => element.category.compareTo(category) == 0)
          .where((element) => element.entrance == false)
          .map((e) => e.value).reduce((sum, element) => sum + element).truncateToDouble(), 0
      ));
    }catch(e){
      t.add(ChartData("Expense",0,0 ));
    }
    return t;
  }
  static List<ChartData> getAmountGivenDateStaked(String period) {
    DateTime d = subDateGivenDateFineGrane(DateTime.now(),period);
    List<ChartData> t=[];
    try {
      t.add(ChartData("Income", getTransactions()
          .values
          .where((element) => element.dateTime.isAfter(d))
          .where((element) => element.entrance == true)
          .map((e) => e.value).reduce((sum, element) => sum + element).truncateToDouble(), 0
      ));
    }catch(e){
      t.add(ChartData("Income",0,0 ));
    }
    try {
      t.add(ChartData("Expense", getTransactions()
          .values
          .where((element) => element.dateTime.isAfter(d))
          .where((element) => element.entrance == false)
          .map((e) => e.value).reduce((sum, element) => sum + element).truncateToDouble(), 0
      ));
    }catch(e){
      t.add(ChartData("Expense",0,0 ));
    }
    return t;
  }

  static double getTotalAmountTransactions(){
    try {
      return getTransactions()
          .values
          .map((e) {
        if (e.entrance)
          return e.value;
        return e.value * -1;
      }).reduce((sum, element) => sum + element).truncateToDouble();
    }
    catch(e){
      return 0;
    }
  }

}
