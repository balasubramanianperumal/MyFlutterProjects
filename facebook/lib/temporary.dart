import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//void main() {
//  runApp(Tempo());
//}

class Tempo extends StatefulWidget {
  @override
  _TempoState createState() => _TempoState();
}
class _TempoState extends State<Tempo> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<dynamic> getData() async{
    var url =
        "https://graph.facebook.com/v7.0/me?fields=id%2Cname%2Cposts%7Bmessage%7D&access_token=EAAI6yd3S9nQBAKkeCQsA3HZCjIp7Wdppeqsi2WQY7UtujWAElaelO48pmWTCxRkJYZAgWsLZAaEXVlau8zz4025uVsFqCKS4PrmI9E87ZB0YVKyZCWEEkzhqt8cPqP3b0bSvSHwjVhywLMgZAnXrw4ehHefU3MYJ8DZB48J3F9xDtKQ0n4umkxZCVNQsXa2Vco5ORxHbPHP4KQZDZD";
    NetworkHelper netWork = NetworkHelper(url);
    var messages = await netWork.getData();

    if(messages == null){
      return null;
    }
    else{
      for(int i =0; i <messages['posts']['data'].length;i++){
        if(messages['posts']['data'][i]['message'] != null){
          print(messages['posts']['data'][i]['message']);
        }
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Text('facebook'),
          ),
        ),
      ),
    );
  }
}

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    }
    else {
      print(response.statusCode);
    }
  }
}