import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';
import '../models/user.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  User? currentUser =Boxes.getConfigUser().get("localUser");

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            updateUserDataPathImage(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 13),
                  ),
                  updateUserDataUserName(),
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Container(
            //margin: EdgeInsets.only(top: 10, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38.0),
                  topRight: Radius.circular(38.0),
                  bottomLeft: Radius.circular(38.0),
                  bottomRight: Radius.circular(38.0),
                )),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
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
          ),
        )
      ],
    );
  }

  ValueListenableBuilder<Box<User>> updateUserDataPathImage() => ValueListenableBuilder(
      valueListenable: Boxes.getConfigUser().listenable(),
      builder: (cntx, box, _){
        return Container(
              width: MediaQuery.of(context).size.width *0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow.shade600,
                  image: DecorationImage(
                      image: AssetImage(Boxes.getConfigUserLocal()!.pathImage_avatar))),
            );
      }
  );
  ValueListenableBuilder<Box<User>> updateUserDataUserName() => ValueListenableBuilder(
      valueListenable: Boxes.getConfigUser().listenable(),
      builder: (cntx, box, _){
        return Text(
          Boxes.getConfigUserLocal()!.username,
          style: TextStyle(color: Colors.white, fontSize: 20),
        );
      }
  );

}
