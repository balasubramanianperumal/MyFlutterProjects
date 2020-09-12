import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert' as JSON;

import 'pie_chart.dart';

void main() => runApp(Chart());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;
  Map userProfile;
  final faceBookLogin = FacebookLogin();

  _logInWithFB() async{

    final result = await faceBookLogin.logInWithReadPermissions(['email']);

    switch(result.status){
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        print(token);
        final graphResponse = await http.get('https://graph.facebook.com/v5.0/me?fields=name,picture,posts&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);

        setState(() {
          userProfile = profile;
          _isLoggedin = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:

        setState(() {
        _isLoggedin = false;
        });

        break;

      default: {
        //print(result.status);
      }
    }
  }
  _logOut(){
    faceBookLogin.logOut();

    setState(() {
      _isLoggedin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:_isLoggedin?Container(
                  height: 300,
                  width: 300,
                  color: Colors.lightGreenAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        '${userProfile['picture']['data']['url']}',
                        height:50,
                        width:50,
                      ),
                      Text('${userProfile['name']}'),
                      FloatingActionButton(
                        backgroundColor: Colors.black,
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.5,
                          ),
                        ),
                        onPressed: (){
                          _logOut();
                        },
                      )
                    ],
                  ),
                ) :Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email or phone Number',
                          fillColor: Colors.black,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.black,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.lightGreenAccent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0,
                          ),
                        ),
                        onPressed: (){
                          _logInWithFB();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
