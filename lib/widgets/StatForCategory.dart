import 'package:flutter/material.dart';

class StatsForCategory extends StatefulWidget {
  const StatsForCategory({super.key});

  @override
  State<StatsForCategory> createState() => _StatsForCategoryState();
}

class _StatsForCategoryState extends State<StatsForCategory> {
  List<String> categories = ["assets/images/Spotify.png",
    "assets/images/Netflix.png", "assets/images/Ovo.png",
    "assets/images/Shopee.png","assets/images/Dana.png"];

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100],
        borderRadius: radius
        ),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 0.20,
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *0.9,
                      height: MediaQuery.of(context).size.width *1,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width *0.2,
                            width: MediaQuery.of(context).size.width *0.2,
                            child: Image(
                              image: AssetImage(categories[index].toString()),
                            ),
                          ),
                          Text(
                            "Income: 150 Expense: 150",
                            style: TextStyle(
                                fontFamily: "DongleRegular",
                                fontSize: 20,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}