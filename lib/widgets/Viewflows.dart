import 'package:flutter/material.dart';
import 'package:money_manger_app/models/moneyFlow.dart';

class ViewFlows extends StatefulWidget {
  const ViewFlows({super.key});

  @override
  State<ViewFlows> createState() => _ViewFlowsState();
}

class _ViewFlowsState extends State<ViewFlows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 1,
      child: ListView.builder(
        itemCount: listFlows.length,
        itemBuilder: (BuildContext context, index) {
          final selectedElement = listFlows[index];
          return buildTransactionListTile(selectedElement);
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
  );
}
