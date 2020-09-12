import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Data{
  final String name;
  final DateTime time;
  final int dob;
  final int age;

  Data({@required this.name,@required this.time,@required this.dob,@required this.age});
  
}