import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manger_app/boxes.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllFlows extends StatefulWidget {
  const AllFlows({super.key});

  @override
  State<AllFlows> createState() => _AllFlowsState();
}

class _AllFlowsState extends State<AllFlows> {
  List<String> filtersFineGrane = ["Today", "Yesterday", "Last Week", "Last Month", "Last 3 Month", "Last 6 Month", "Last Year"];

  int selectedIndex = 0;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filtersFineGrane.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(28),
                                    topLeft: Radius.circular(28),
                                    bottomLeft: Radius.circular(28),
                                    bottomRight: Radius.circular(28),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Text(filtersFineGrane[index].toString(),
                                      style: TextStyle(
                                          fontFamily: "DongleRegular",
                                          fontSize: 16,
                                          fontWeight: index == selectedIndex
                                              ? FontWeight.bold
                                              : FontWeight.w300,
                                          color: index == selectedIndex
                                              ? Colors.white
                                              : Colors.black)),
                                )),
                          ),
                        );
                      })),
            ),
            // Inseriamo il list builder
            // ##################################
            Expanded(
              //flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 1,
                child: updateHistory(),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildTransactionListTile(MoneyFlow moneyFlow) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 3),
        title: Text(
          moneyFlow.title_flow,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        subtitle: Text(moneyFlow.convertDateTime()),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
                  width: 2,
                  height: MediaQuery.of(context).size.width * 0.03,
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
                  height: MediaQuery.of(context).size.width * 0.03,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/Spotify.png"),
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              moneyFlow.value.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.blueGrey,
              size: 30,
            ),
          ],
        ),
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      );

  ValueListenableBuilder<Box<MoneyFlow>> updateHistory() => ValueListenableBuilder(
      valueListenable: Boxes.getTransactions().listenable(),
      builder: (cntx, box, _){
        List<MoneyFlow> l= Boxes.getTransactionsGivenDate(subDateGivenDateFineGrane(DateTime.now(), filtersFineGrane[selectedIndex]));

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: l.length, //listFlows.length,
          itemBuilder: (BuildContext context, index) {
            final selectedElement = l.elementAt(index);
            return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context)=> box.delete(selectedElement.id),
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete_outline,
                    label: "Delete",
                  ),
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.edit_outlined,
                    label: "Edit",
                  )
                ],
              ),
              child: buildTransactionListTile(selectedElement),
            );
          },
        );
      }
  );

}
