import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_manger_app/boxes.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:money_manger_app/models/user.dart';
import 'package:money_manger_app/screens/homescreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(MoneyFlowAdapter());
  await Hive.openBox<User>("user");
  await Hive.openBox<MoneyFlow>("transactions");
  // FIST TIME THAT HAVE A USER
  if (Boxes.getConfigUserLocal()==null)
    Boxes.setConfigUserLocal(User("New User", 0, "assets/images/avatars/Avatar01.png","La mia banca"));

  // generate transaction
  //Boxes.getTransactions().clear();

  /*DateTime? start = DateTime.tryParse("2022-01-01 00:00:00");
  for (int i=0; i< 15 ;i ++ )
  {
    int r=Random.secure().nextInt(365);
    String id=Uuid().v4();
    Boxes.addTransactions(id,MoneyFlow(i.toString(),r.toDouble(),start!.add(Duration(days: r)), "assets/images/categories/Shopee.png", false, id));
    print("Added: ${start!.add(Duration(days: r))}");
  }
  String id=Uuid().v4();

  Boxes.addTransactions(id,MoneyFlow("i.toString()",10,DateTime.now(), "assets/images/categories/Shopee.png", true,id));*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Monanger Money APP',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.blue,
        accentColor: Colors.blue.shade50,

      ),
      home: HomeScreen(),
    );
  }
}

