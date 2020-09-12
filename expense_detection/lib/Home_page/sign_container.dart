import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_detection/Kconstants.dart';

class SignContainer extends StatelessWidget {

  final String name;
  final Function signUp;
  final Function emailChange;
  final Function passwordChange;

  SignContainer({@required this.name,@required this.signUp,@required this.emailChange,@required this.passwordChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'SpendiFy',
                style: KAppBarStyle.copyWith(
                  fontSize: 50.0,
                ),
              ),
              Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage('images/logo.png'),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            onChanged:emailChange,
            decoration: KTextFieldDecoration.copyWith(
              hintText: 'Email_Id',
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          TextField(
            onChanged: passwordChange,
            decoration: KTextFieldDecoration.copyWith(
              hintText: 'Password',
            ),
          ),
          RaisedButton(
            color: KCustomGreen,
            child: Text(
              name,
              style:TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            onPressed: signUp,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
          ),
        ],
      ),
    );
  }
}
