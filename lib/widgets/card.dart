import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';
import '../models/user.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        //width: MediaQuery.of(context).size.width * 0.3,
        //height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, color: Color(0x33423D3D), offset: Offset(4, 2))
            ],
            gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.amber],
              stops: [0,1],
                begin: AlignmentDirectional(-1, -0.60),
                end: AlignmentDirectional(1,0.60)
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_outlined,
                      color: Colors.black87,
                      size: 45,
                    ),
                    updateUserDataBankName(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 15),
                child: Image.asset(
                  'assets/images/Chipcard.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "**** **** **** ****",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        letterSpacing: 10,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 10, 0, 0),
                          child: updateUserDataUserName(),
                        ),
                        Image.asset(
                          'assets/images/cc.png',
                          width: 60,
                          height: 35,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  ValueListenableBuilder<Box<User>> updateUserDataBankName() => ValueListenableBuilder(
      valueListenable: Boxes.getConfigUser().listenable(),
      builder: (cntx, box, _){
        return Text(
          "\t\t${Boxes.getConfigUserLocal()!.bank_name}",
          textAlign: TextAlign.start,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
              fontFamily: "DongleRegular",
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        );
      }
  );
  ValueListenableBuilder<Box<User>> updateUserDataUserName() => ValueListenableBuilder(
      valueListenable: Boxes.getConfigUser().listenable(),
      builder: (cntx, box, _){
        return Text(
            "${Boxes.getConfigUserLocal()!.username}",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),);
      }
  );

}
