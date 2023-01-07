import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manger_app/boxes.dart';
import 'package:money_manger_app/models/user.dart';
import 'package:money_manger_app/widgets/AlertDone.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final myControllerUsername = TextEditingController();
  final myControllerBankName = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerUsername.dispose();
    super.dispose();
  }
  User? currentUser;
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    currentUser =Boxes.getConfigUser().get("localUser");
    myControllerBankName.text=currentUser!.bank_name;
    myControllerUsername.text=currentUser!.username;
  }

  late Timer _timer;
  Color selectedColor = Colors.amber;
  Color unselectedColor = Colors.transparent!;
  int selected_item = 0;
  List<String> items = [
    "assets/images/avatars/Avatar01.png",
    "assets/images/avatars/Avatar02.png",
    "assets/images/avatars/Avatar03.png",
    "assets/images/avatars/Avatar04.png",
    "assets/images/avatars/Avatar05.png",
    "assets/images/avatars/Avatar06.png",
    "assets/images/avatars/Avatar07.png",
    "assets/images/avatars/Avatar08.png",
    "assets/images/avatars/Avatar09.png",
    "assets/images/avatars/Avatar10.png",
    "assets/images/avatars/Avatar11.png",
  ];

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(50.0),
      topRight: Radius.circular(50.0),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1260),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.2,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Setting page",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "DongleRegular",
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  items[selected_item].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Change avatar",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "DongleRegular",
                    fontWeight: FontWeight.w400),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_item = index;
                            });
                          },
                          child: buildListAvatar(
                              items[index], selected_item, index));
                    }),
              ),
              Divider(
                thickness: 1,
              ),
              TextFormField(
                controller: myControllerUsername,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  border: UnderlineInputBorder(),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Name',
                  hintText: currentUser?.username,
                  
                ),
              ),
              TextFormField(
                controller: myControllerBankName,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  border: UnderlineInputBorder(),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Bank account name',
                  hintText: currentUser?.bank_name,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: onButtonSaved,
                  child: Text('Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListAvatar(String pathImage, int selected, int index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: selected_item == index ? 40 : 30,
            backgroundImage: AssetImage(pathImage),
            backgroundColor:
                selected_item == index ? selectedColor : unselectedColor,
          ),
        ),
      );

  void onButtonSaved() => showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          _timer = Timer(Duration(milliseconds: 500), () {
            Navigator.of(context).pop();
          });
          saveSettings(myControllerUsername.text, myControllerBankName.text, items[selected_item]);
          return AlertDone();
        },
      ).then((val) {
        if (_timer.isActive) {
          _timer.cancel();
        }
      });

  Future saveSettings(String name, String bankname, String pathImg) async {
    //User?  u = Boxes.getConfigUserLocal();
    if ( Boxes.getConfigUserLocal()!=null )
      Boxes.setConfigUserLocal(User(name, 0, pathImg,bankname));
  }
}
