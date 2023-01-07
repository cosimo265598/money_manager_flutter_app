import 'dart:math';

import 'package:hive/hive.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:money_manger_app/models/user.dart';

class Boxes {
  static Box<User> getConfigUser() => Hive.box<User>("user");
  static User? getConfigUserLocal() => Hive.box<User>("user").get("localUser");
  static Future<void> setConfigUserLocal(User user) =>      Hive.box<User>("user").put("localUser", user);

  static Box<MoneyFlow> getTransactions() =>       Hive.box<MoneyFlow>("transactions");
  static Future<void> addTransactions(String uuid,MoneyFlow m) =>      Hive.box<MoneyFlow>("transactions").put(uuid,m);
  static List<MoneyFlow> getRecentTransactions(    int n_max  ) {
    List<MoneyFlow> t = getTransactions()
        .values
        .toList();
    t.sort((a, b) => -a.dateTime.compareTo(b.dateTime) );
    t.take(n_max);
    print(t.length);
    return t;
  }
  static List<double> getTransactionsIncomeAndExpense(DateTime d) {
    List<double> in_ex=[];
    try{
      double _income= getTransactions().values.where((element) => element.dateTime.isAfter(d) && element.entrance==true).map((e) => e.value).
      reduce((sum, element) => sum+element);
      in_ex.add(_income);
    } catch(e){
      in_ex.add(0);
    }
    try{
      double _expense= getTransactions().values.where((element) => element.dateTime.isAfter(d) && element.entrance==false).map((e) => e.value).
      reduce((sum, element) => sum+element);
      in_ex.add(_expense);
    } catch(e){
      in_ex.add(0);
    }
    return  in_ex;
  }
  static List<MoneyFlow> getTransactionsGivenDate(DateTime d) {

    return getTransactions().values.where((element) => element.dateTime.isAfter(d)).toList();

  }
}
