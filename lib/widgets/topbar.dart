import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width *0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow.shade600,
                  image: DecorationImage(
                      image: AssetImage("assets/images/Avatar.png"))),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                  ),
                  Text(
                    "Cosimo Manisi",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(top: 10, right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38.0),
                topRight: Radius.circular(38.0),
                bottomLeft: Radius.circular(38.0),
                bottomRight: Radius.circular(38.0),
              )),
          child: Row(
            children: [
              Icon(
                Icons.account_balance_rounded,
                color: Colors.blue,
              ),
              Text(
                "1563,25",
                style: TextStyle(
                    color: Colors.blue, fontSize: 24, letterSpacing: 1.3),
              )
            ],
          ),
        )
      ],
    );
  }
}
