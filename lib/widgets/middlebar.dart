import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Middlebar extends StatefulWidget {
  const Middlebar({super.key});

  @override
  State<Middlebar> createState() => _MiddlebarState();
}

class _MiddlebarState extends State<Middlebar> {
  int selectedIndex = 0;
  final Map<String, String> map = {
    "Pay": "assets/images/Pay.png",
    "Transfer": "assets/images/Transfer.png",
    "Saving": "assets/images/Savings.png"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      height: MediaQuery.of(context).size.height * 0.16,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: map.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.25,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: Image(
                        image: AssetImage(map["Pay"].toString()),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Pay",
                        style: TextStyle(
                            fontFamily: "DongleRegular",
                            fontSize: 20,
                            color: Colors.grey.shade700),
                      ),
                    )
                  ],
                )),
            );
          }
    )));
  }
}
