import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manger_app/boxes.dart';
import 'package:money_manger_app/models/category.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:uuid/uuid.dart';

import '../models/category.dart';
import 'AlertDone.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final myControllerAmount = TextEditingController();
  final myControllerDescritpion = TextEditingController();

  @override
  void initState(){
    myControllerAmount.text="0.0";
    myControllerDescritpion.text="General";
  }
  DateTime myControllerDate= DateTime.now();
  late Timer _timer;


  bool income = false;
  Color selectedColor = Colors.amber;
  Color unselectedColor = Colors.blue[100]!;
  double unselectedSize= 30;
  double selectedSize= 50;
  int selectedIndex = 0;
  List<String> l_cat=getCategoriesAvailable().keys.toList();
  String category_selected = getCategoriesAvailable().keys.toList().first;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(50.0),
      topRight: Radius.circular(50.0),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Add transaction",
                style: TextStyle(
                  fontFamily: "DongleRegular",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: TextFormField(
                controller: myControllerAmount,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 60,
                ),
                decoration: new InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.euro_symbol_rounded,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: TextFormField(
                controller: myControllerDescritpion,
                style: TextStyle(
                  fontFamily: "DongleRegular",
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w500),
                  border: UnderlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Income",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  Switch(
                    // This bool value toggles the switch.
                    inactiveThumbColor: Colors.green,
                    inactiveTrackColor: Colors.lightGreen,
                    value: income,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        income = value;
                      });
                    },
                  ),
                  Text("Expense",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontFamily: "DongleRegular",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: ListView.builder(
                      /*
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),*/
                      scrollDirection: Axis.horizontal,
                      itemCount: l_cat.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            width: 90,
                            duration: const Duration(milliseconds: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? selectedColor
                                    : unselectedColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    category_selected = l_cat.elementAt(selectedIndex);
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(l_cat.elementAt(index)),
                                        radius: index==selectedIndex ? 30:20,
                                        foregroundColor: Colors.transparent,
                                        //width: MediaQuery.of(context).size.width * (index==selectedIndex ? 0.13 : 0.1),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        getCategoriesAvailable()[l_cat.elementAt(index)].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: index==selectedIndex ? FontWeight.bold : FontWeight.normal,
                                            fontFamily: "DongleRegular",
                                            fontSize: 20,
                                            color: Colors.grey.shade700,
                                            ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Container(
                  //height: MediaQuery.of(context).size.height * 0.27,
                  child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.utc(1970),
                      lastDate: DateTime.now(),
                      onDateChanged: (DateTime other) {
                        myControllerDate=other;
                      })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  onPressed: saveDataTransaction,
                  child: Text('Save' ,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveDataTransaction() => showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      _timer = Timer(Duration(milliseconds: 500), () {
        Navigator.of(context).pop();
      });
      /*print(myControllerDescritpion.text);
      print(myControllerAmount.text);
      print(myControllerDate);
      print(category_selected);*/
      String id=Uuid().v4();
      Boxes.addTransactions(id, MoneyFlow(myControllerDescritpion.text, double.parse(myControllerAmount.text.toString()), myControllerDate, category_selected, !income, id));
      return AlertAddDone();
    },
  ).then((val) {
    if (_timer.isActive) {
      _timer.cancel();
    }
  });

}
