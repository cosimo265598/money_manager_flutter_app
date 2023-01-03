import 'package:flutter/material.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:money_manger_app/widgets/Viewflows.dart';

class AllFlows extends StatefulWidget {
  const AllFlows({super.key});

  @override
  State<AllFlows> createState() => _AllFlowsState();
}

class _AllFlowsState extends State<AllFlows> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 10),
      child: Expanded(
          child: Container(
        //margin: EdgeInsets.only(top: 0),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "All Transactions",
                    style: TextStyle(
                      fontFamily: "DongleRegular",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            // Inseriamo il list builder
            // ##################################
            Expanded(
              //flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listFlows.length,
                  itemBuilder: (BuildContext context, index) {
                    final selectedElement = listFlows[index];
                    return buildTransactionListTile(selectedElement);
                    /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width * 0.7,
                              //height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  )),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
                                        width: 2,
                                        height: MediaQuery.of(context).size.width * 0.08,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(30)),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
                                        width: 2,
                                        height: MediaQuery.of(context).size.width * 0.08,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.width * 0.13,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image(
                                      image: AssetImage("assets/images/Spotify.png"),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.width * 0.15,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          selectedElement.title_flow,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          selectedElement.convertDateTime(),
                                          style: TextStyle(color: Colors.grey, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                selectedElement.value.toString(),
                                style:
                                TextStyle(fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  //color: selectedElement.entrance ? Colors.green : Colors.redAccent
                                ),
                              ),
                            ),
                          ],
                        );*/
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildTransactionListTile(MoneyFlow moneyFlow) => ListTile(
        contentPadding: const EdgeInsets.all(1),
        title: Text(
          moneyFlow.title_flow,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        subtitle: Text(moneyFlow.convertDateTime()),
        leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/Spotify.png"),backgroundColor: Colors.transparent,),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              moneyFlow.value.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.blueGrey,
              size: 20,
            ),
          ],
        ),
        tileColor: Colors.green,
        selectedTileColor: Colors.red,
        dense: true,
      );
}
