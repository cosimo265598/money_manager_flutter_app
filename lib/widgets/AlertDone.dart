import 'package:flutter/material.dart';
class AlertDone extends StatelessWidget {
  const AlertDone({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Configuration Saved'),
          content:  CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/tick_done.png"),backgroundColor: Colors.transparent,),
    );
  }
}