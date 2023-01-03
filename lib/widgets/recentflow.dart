import 'package:flutter/material.dart';
import 'package:money_manger_app/models/moneyFlow.dart';
import 'package:money_manger_app/widgets/Viewflows.dart';

class RecentFlows extends StatefulWidget {
  const RecentFlows({super.key});

  @override
  State<RecentFlows> createState() => _RecentFlowsState();
}

class _RecentFlowsState extends State<RecentFlows> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 10),
      child: Expanded(child: Container(
        margin: EdgeInsets.only(top: 0),
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
                      "Recent Transactions",
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
                  child: ViewFlows(),
              ),
            ],
          ),
        )),
    );
  }
}
