import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';
import '../models/moneyFlow.dart';

class MiddlebarHome extends StatefulWidget {
  const MiddlebarHome({super.key});

  @override
  State<MiddlebarHome> createState() => _MiddlebarHomeState();
}

class _MiddlebarHomeState extends State<MiddlebarHome> {



  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
      bottomLeft: Radius.circular(24.0),
      bottomRight: Radius.circular(24.0),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          //width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
              color: Colors.amberAccent[200],
            borderRadius: radius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
              child: updateIncomeOverall(),
            ),
            //height: MediaQuery.of(context).size.height * 0.16,
      ),
    );
  }

  ValueListenableBuilder<Box<MoneyFlow>> updateIncomeOverall() => ValueListenableBuilder(
      valueListenable: Boxes.getTransactions().listenable(),
      builder: (cntx, box, _){
          List<double> d = Boxes.getTransactionsIncomeAndExpense(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day));
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Income",
                    style: TextStyle(
                      fontFamily: "DongleRegular",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.euro_symbol_rounded,size: 30,),
                      Text(
                        "${d[0].truncateToDouble()}",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: "DongleRegular",
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),],
              ),
              Container(
                //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
                width: 1,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Column(
                children: [
                  Text(
                    "Expense",
                    style: TextStyle(
                      fontFamily: "DongleRegular",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.euro_symbol_rounded,size: 30,),
                      Text(
                        "${d[1].truncateToDouble()}",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          letterSpacing: 2,
                          fontFamily: "DongleRegular",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
      }
  );

}
