import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manger_app/boxes.dart';
import 'package:money_manger_app/models/category.dart';
import 'package:money_manger_app/widgets/StackedColumns.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/ChartData.dart';
import '../models/moneyFlow.dart';

class Statisticspage extends StatefulWidget {
  const Statisticspage({super.key});

  @override
  State<Statisticspage> createState() => _StatisticspageState();
}


class _StatisticspageState extends State<Statisticspage> {
  @override
  void initState() {}
  Color selectedColor = Colors.amber;
  Color unselectedColor = Colors.transparent!;
  List<String> periods = [
    "Today",
    "Yesterday",
    "Last week",
    "Last month",
    "Last 3 month",
    "Last 6 month",
    "Last year",
    "All",
  ];
  String selected_item = "Today";
  List<String> cat_items = getCategoriesAvailable().keys.toList();

  final List<ChartData> chartDataCategories = [
    ChartData('Income', 12, 10,),
    ChartData('Expense', 14, 11, ),
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
        //height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Statistics page",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "DongleRegular",
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Period",style: TextStyle(
                      fontSize: 16,
                      fontFamily: "DongleRegular",
                      fontWeight: FontWeight.w300),),
                  DropdownButton(
                    elevation: 0,
                    style: TextStyle(
                      color: Colors.black,
                        fontSize: 16,
                        fontFamily: "DongleRegular",
                        fontWeight: FontWeight.w300),
                    value: selected_item,
                    items: getDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        selected_item = value!;
                        print(selected_item);
                      });
                      print(selected_item);
                    },
                  ),
                ],
              ),
              StackedChart(),
              Container(
                width: double.infinity,
                //height: MediaQuery.of(context).size.height *0.1,
                decoration: BoxDecoration(
                  borderRadius: radius,
                  color: Colors.grey.shade200,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Amount expense for category",style: TextStyle(
                          fontSize: 20,
                          fontFamily: "DongleRegular",
                          fontWeight: FontWeight.w300),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: cat_items.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: buildGridCat(cat_items[index]),
                                );
                              })),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get getDropDown {
    List<DropdownMenuItem<String>> itemsRet = [];
    for (int i = 0; i < periods.length; i++) {
      itemsRet.add(DropdownMenuItem(
        child: Text(periods[i].toString()),
        value: periods[i],
      ));
    }
    return itemsRet;
  }

  Widget buildGridCat(String pathImage) => Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          //clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            //shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage(pathImage),
                fit: BoxFit.scaleDown,scale: 30
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0),
              bottomLeft: Radius.circular(18.0),
            ),
          ),
          child: SfCircularChart(
            series: <CircularSeries>[
              RadialBarSeries<ChartData, String>(
                dataSource: Boxes.getAmountGivenDate(subDateGivenDateFineGrane(DateTime.now(),selected_item), pathImage),
                dataLabelSettings: DataLabelSettings(
                  overflowMode: OverflowMode.shift,
                    isVisible: true,
                    connectorLineSettings:
                        ConnectorLineSettings(type: ConnectorType.curve),
                    labelPosition: ChartDataLabelPosition.outside,
                    labelIntersectAction: LabelIntersectAction.shift),
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y1,
                cornerStyle: CornerStyle.bothCurve,
                trackOpacity: 0.1,
                useSeriesColor: true,
              )
            ],
          ),
        ),
      );
}
