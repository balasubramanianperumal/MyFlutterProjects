import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Center(
            child: Text(
              "I am Poor",
              style: TextStyle(fontStyle: FontStyle.italic, fontWeight:FontWeight.bold),
            ),
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/moneyheist.png'),
          ),
        ),
      ),
    ),
  );
}
