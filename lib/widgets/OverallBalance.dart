import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OverallBalance extends StatefulWidget {
  const OverallBalance({super.key});

  @override
  State<OverallBalance> createState() => _OverallBalanceState();
}

class _OverallBalanceState extends State<OverallBalance> {
  int selectedIndex = 0;
  final Map<String, String> map = {
    "Pay": "assets/images/Pay.png",
    "Transfer": "assets/images/Transfer.png",
    "Saving": "assets/images/Savings.png"
  };

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
      bottomRight:  Radius.circular(24.0),
      bottomLeft:  Radius.circular(24.0),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              color: Colors.grey,
            borderRadius: radius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_rounded,size: 50,),
                              Text(
                                "BANK ACCOUNT",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: "DongleRegular",
                                  fontSize: 30,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),],
                      ),
                    ]
                  ),
                  // image chip
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("assets/images/Chipcard.png",width: 60,height: 60,),
                  ),
                  Row(
                    children: [
                      Text(
                        "Total balance: ",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: "DongleRegular",
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        "8750.36",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: "DongleRegular",
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //height: MediaQuery.of(context).size.height * 0.16,
      ),
    );
  }
}
