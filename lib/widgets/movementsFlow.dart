import 'package:flutter/material.dart';
import 'package:money_manger_app/models/moneyFlow.dart';

class MoveFlows extends StatefulWidget {
  const MoveFlows({super.key});

  @override
  State<MoveFlows> createState() => _MoveFlowsState();
}

class _MoveFlowsState extends State<MoveFlows> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38.0),
            topRight: Radius.circular(38.0),
          ),
        ),
        child: ListView.builder(
          itemCount: listFlows.length,
          itemBuilder: (BuildContext context, index) {
            final flowIndex = listFlows[index];
            return Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    hoverColor: Colors.red,
                    tooltip: "Delete",
                    child: Icon(Icons.delete_forever),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    hoverColor: Colors.green,
                    tooltip: "Modify",
                    child: Icon(Icons.change_circle),
                  ),
                  Icon(
                    flowIndex.entrance
                        ? Icons.arrow_circle_up_outlined
                        : Icons.arrow_circle_down_outlined,
                    size: 38,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flowIndex.dateTime.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        flowIndex.title_flow,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(flowIndex.value.toString(),
                      style: TextStyle(fontSize: 24)),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38.0),
                  topRight: Radius.circular(38.0),
                  bottomLeft: Radius.circular(38.0),
                  bottomRight: Radius.circular(38.0),
                ),
              ),
            );
          }),
    ));
  }
}
