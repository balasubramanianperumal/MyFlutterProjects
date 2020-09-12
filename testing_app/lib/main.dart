import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightGreenAccent,
          appBar: AppBar(
            title: Center(
              child: Text("I_Wish_For",
              style: TextStyle(fontStyle: FontStyle.italic),),
            ),
            backgroundColor: Colors.yellowAccent,
          ),
          body: Center(
              child:Image(
                image:AssetImage('images/diamond.png'),
              )
          ),
    ),
  )
);
