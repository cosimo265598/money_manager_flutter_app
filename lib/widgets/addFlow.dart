import 'package:flutter/material.dart';

class AddFlow extends StatefulWidget {
  const AddFlow({super.key});

  @override
  State<AddFlow> createState() => _AddFlowState();
}


class _AddFlowState extends State<AddFlow> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      //backgroundColor: Theme.of(context).primaryColor,
      //elevation: 5.0,
      //title: Text('Money Flow', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      //child: ElevatedButton(
      //  mainAxisAlignment: MainAxisAlignment.end,
      //    children: [
      //     Text("Fast add flow: "),
      //      FloatingActionButton(
      //        onPressed: () {},
      //        hoverColor: Colors.green,
      //        tooltip: "Add flow",
      //        child: Icon(Icons.add),
      //      )
      //    ],
      //),
    );
  }
}