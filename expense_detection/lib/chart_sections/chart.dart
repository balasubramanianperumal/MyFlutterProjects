import 'package:expense_detection/Kconstants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../transaction_sections/transaction.dart';
import 'chartbar.dart';

class Chart extends StatefulWidget {

  Chart({this.recentTransactions});

  final List<Transaction> recentTransactions;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  final Map<String, double> dataMap = Map();

  List<Map<String, Object>> get grpTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < widget.recentTransactions.length; i++) {
        if (widget.recentTransactions[i].date.day == weekDay.day &&
            widget.recentTransactions[i].date.month == weekDay.month &&
            widget.recentTransactions[i].date.year == weekDay.year) {
          totalSum += widget.recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return grpTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      elevation: 4.5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: grpTransactions.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: data['day'],
                    spendingAmount: data['amount'],
                    perOfAmount: totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: widget.recentTransactions.isEmpty
                  ? Text(
                'Zero Transactions....Empty chart',
                style: KIntStyle,
              ):PieChart(
                dataMap: {
                  '${grpTransactions[0]['day']}': grpTransactions[0]
                  ['amount'],
                  '${grpTransactions[1]['day']}': grpTransactions[1]
                  ['amount'],
                  '${grpTransactions[2]['day']}': grpTransactions[2]
                  ['amount'],
                  '${grpTransactions[3]['day']}': grpTransactions[3]
                  ['amount'],
                  '${grpTransactions[4]['day']}': grpTransactions[4]
                  ['amount'],
                  '${grpTransactions[5]['day']}': grpTransactions[5]
                  ['amount'],
                  '${grpTransactions[6]['day']}': grpTransactions[6]
                  ['amount']
                },
                chartLegendSpacing: 35.0,
                chartRadius:
                200, //MediaQuery.of(context).size.width / 2.7,
                showChartValuesInPercentage: true,
                showChartValues: false,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.transparent,
                colorList: colorList,
                showLegends: true,
                legendPosition: LegendPosition.right,
                decimalPlaces: 1,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                    backgroundColor: Colors.transparent,
                    color: Colors.black,
                    //fontFamily: 'Quicksand',
                    fontSize: 12.5,
                  ),
                chartType: ChartType.ring,
              ) ,
            ),
            Text('Weekly Chart',style: KTextStyle,),
          ],
        ),
      ),
    );
  }
}
