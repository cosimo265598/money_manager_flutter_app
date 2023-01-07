import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  List<String> items = [
    "assets/images/categories/Netflix.png",
    "assets/images/categories/Shopee.png",
    "assets/images/categories/Spotify.png",
    "assets/images/categories/Netflix.png",
    "assets/images/categories/Shopee.png",
    "assets/images/categories/Spotify.png",
    "assets/images/categories/Netflix.png",
    "assets/images/categories/Shopee.png",
    "assets/images/categories/Spotify.png"
  ];
  Map<String, String> itemsMap = {
    "assets/images/categories/Netflix.png": "Netflix",
    "assets/images/categories/Shopee.png": "Shoppee",
    "assets/images/categories/Spotify.png": "Spotify",
  };
  String selected_item = "Netflix";
  bool income_expense = false;
  Color selectedColor = Colors.amber;
  Color unselectedColor = Colors.blue[100]!;
  double unselectedSize= 30;
  double selectedSize= 50;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(50.0),
      topRight: Radius.circular(50.0),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.2,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Add transaction",
                style: TextStyle(
                  fontFamily: "DongleRegular",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 60,
                ),
                decoration: new InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.euro_symbol_rounded,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: TextFormField(
                style: TextStyle(
                  fontFamily: "DongleRegular",
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w500),
                  border: UnderlineInputBorder(),
                  labelText: 'Description',

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Income",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  Switch(
                    // This bool value toggles the switch.
                    inactiveThumbColor: Colors.green,
                    inactiveTrackColor: Colors.lightGreen,
                    value: income_expense,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        income_expense = value;
                      });
                    },
                  ),
                  Text("Expense",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontFamily: "DongleRegular",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: ListView.builder(
                      /*
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),*/
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            width: 90,
                            duration: const Duration(milliseconds: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? selectedColor
                                    : unselectedColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(items[index]),
                                        radius: index==selectedIndex ? 30:20,
                                        foregroundColor: Colors.transparent,
                                        //width: MediaQuery.of(context).size.width * (index==selectedIndex ? 0.13 : 0.1),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        itemsMap[items[index]].toString(),
                                        style: TextStyle(
                                          fontWeight: index==selectedIndex ? FontWeight.bold : FontWeight.normal,
                                            fontFamily: "DongleRegular",
                                            fontSize: 20,
                                            color: Colors.grey.shade700,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Container(
                  //height: MediaQuery.of(context).size.height * 0.27,
                  child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.utc(1970),
                      lastDate: DateTime.now(),
                      onDateChanged: (DateTime t) {
                        print(t);
                      })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save' ,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
