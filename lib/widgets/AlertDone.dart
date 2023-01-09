import 'package:flutter/material.dart';
class AlertConfigDone extends StatelessWidget {
  const AlertConfigDone({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Configuration Saved',textAlign: TextAlign.center,),
          content:  CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/tick_done.png"),backgroundColor: Colors.transparent,),
    );
  }
}

class AlertAddDone extends StatelessWidget {
  const AlertAddDone({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Transaction Saved',textAlign: TextAlign.center,),
      content:  CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage("assets/images/tick_done.png"),backgroundColor: Colors.transparent,),
    );
  }
}