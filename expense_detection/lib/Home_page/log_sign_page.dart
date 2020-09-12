import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'sign_container.dart';
import 'home_page.dart';

class UserLogin extends StatefulWidget {

  static String id = 'User';
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool spinnerHud = false;

  addEmailAndPassword(String email ,String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('emailValue', email);
    prefs.setString('passwordValue', password);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: spinnerHud,
          child: SignContainer(
            emailChange: (value){
              setState(() {
                email = value;
              });
              },
            passwordChange: (value){
              setState(() {
                password = value;
              });
            },
            name: 'Login as user',
            signUp:email != null && password != null ?(){
              setState(() {
                setState(() {
                  spinnerHud = true;
                  _showMyDialog();
                });
                addEmailAndPassword(email, password);
                try{
                  final user = _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(user != null){
                    Navigator.pushNamed(context, HomePage.id);
                  }
                }
                catch(e){
                  switch (e){

                  }
                }
              });
              setState(() {
                spinnerHud = false;
              });
            }:(){},
          ),
        ),
      ),
    );
  }
}