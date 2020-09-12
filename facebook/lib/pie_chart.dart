  import 'package:flutter/material.dart';
  import 'package:pie_chart/pie_chart.dart';


  class Chart extends StatefulWidget {
    @override
    _ChartState createState() => _ChartState();
  }

  class _ChartState extends State<Chart> {

    bool toggle = false;

    Map<String, double> dataMap = Map();

    List<Color> colorList = [
      Colors.orangeAccent.shade200,
      Colors.white,
      Colors.yellowAccent.shade200,
      Colors.black,
      Colors.lightGreenAccent,
      Colors.redAccent.shade200,
      Colors.tealAccent.shade200,
    ];

    void togglePieChart() {
      setState(() {
        toggle = !toggle;
      });
    }

    @override
    void initState() {
      super.initState();
      dataMap.putIfAbsent("Mo", () =>5000);
      dataMap.putIfAbsent("Tu", () => 3000);
      dataMap.putIfAbsent("We", () => 2000);
      dataMap.putIfAbsent("Th", () => 2000);
      dataMap.putIfAbsent("Fr", () => 200);
      dataMap.putIfAbsent("Sa", () => 2100);
      dataMap.putIfAbsent("Su", () => 500);
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('PieChart'),
            actions: [
              IconButton(
                icon: Icon(Icons.insert_chart),
                onPressed: togglePieChart,
              ),
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 15.0),
                  child: Center(
                    child: toggle
                        ? PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32.0,
                      chartRadius:200,//MediaQuery.of(context).size.width / 2.7,
                      showChartValuesInPercentage: true,
                      showChartValues: false,
                      showChartValuesOutside: false,
                      chartValueBackgroundColor: Colors.grey[200],
                      colorList: colorList,
                      showLegends: true,
                      legendPosition: LegendPosition.right,
                      decimalPlaces: 1,
                      showChartValueLabel: false,
                      initialAngle: 0,
                      chartValueStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      chartType: ChartType.ring,
                    )
                        : Text("Press FAB to show chart"),
                  ),
                )
              ],
            ),
          ),
  //        floatingActionButton: FloatingActionButton(
  //          onPressed: togglePieChart,
  //          child: Icon(Icons.insert_chart),
  //        ),
        ),
      );
    }
  }
