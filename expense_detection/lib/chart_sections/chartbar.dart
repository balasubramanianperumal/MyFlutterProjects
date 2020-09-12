import 'package:flutter/material.dart';
import '../Kconstants.dart';


class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double perOfAmount;

  ChartBar({@required this.label,@required this.spendingAmount,@required this.perOfAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('₹${spendingAmount.toStringAsFixed(0)}',style: KTextStyle,)),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: KCustomBlack,
                    width: 1.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: perOfAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: KCustomGreen,
                    border: Border.all(
                      color:KCustomGreen,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(label,style: KTextStyle,),
      ],
    );
  }
}

