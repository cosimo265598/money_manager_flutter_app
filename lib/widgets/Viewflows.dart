import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manger_app/models/moneyFlow.dart';

import '../boxes.dart';

class ViewFlows extends StatefulWidget {
  const ViewFlows({super.key});

  @override
  State<ViewFlows> createState() => _ViewFlowsState();
}

class _ViewFlowsState extends State<ViewFlows> {
  int MAX_RECENT=10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      //height: MediaQuery.of(context).size.height * 1,
      child: updateTransactions(),
    );
  }

  ValueListenableBuilder<Box<MoneyFlow>> updateTransactions() => ValueListenableBuilder(
      valueListenable: Boxes.getTransactions().listenable(),
      builder: (cntx, box, _){
        if(box.isEmpty)
          return Center(
            child: Text(
              "No recent transactions",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
          );
        List<MoneyFlow> t=Boxes.getRecentTransactions(MAX_RECENT);
        print(t.length);
        return ListView.builder(
          itemCount: t.length,
          itemBuilder: (BuildContext context, index) {
            MoneyFlow selectedElement = t.elementAt(index)!;
            return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => box.delete(selectedElement.id),
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
  );

  void deleteTransaction(Box b, MoneyFlow m){
      b.delete(m);
  }
}
