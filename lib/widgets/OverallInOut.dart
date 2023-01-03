import 'package:flutter/material.dart';

class OverallINOUT extends StatefulWidget {
  const OverallINOUT({super.key});

  @override
  State<OverallINOUT> createState() => _OverallINOUTState();
}

class _OverallINOUTState extends State<OverallINOUT> {
  int selectedIndex = 0;
  final Map<String, String> map = {
    "Pay": "images/Pay.png",
    "Transfer": "images/Transfer.png",
    "Saving": "images/Savings.png"
  };

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
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.width * 0.20,
      child: Container(
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width /2.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.input_rounded,size: 30, color: Colors.lightGreen,),
                  Container(
                    child: Text(
                      "Income",
                      style: TextStyle(
                          fontFamily: "DongleRegular",
                          fontSize: 20,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  Text(
                    "150 €",
                    style: TextStyle(
                        fontFamily: "DongleRegular",
                        fontSize: 20,
                        color: Colors.grey.shade700, ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width / 2.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.output_rounded,size: 30,color: Colors.red,),
                  Container(
                    child: Text(
                      "Expense",
                      style: TextStyle(
                          fontFamily: "DongleRegular",
                          fontSize: 20,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  Text(
                    "150",
                    style: TextStyle(
                        fontFamily: "DongleRegular",
                        fontSize: 20,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
