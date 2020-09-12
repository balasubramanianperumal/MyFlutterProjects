import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Kconstants.dart';

class NewTransaction extends StatefulWidget {

  final Function addTransaction;
  NewTransaction({@required this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _inputTitleController = TextEditingController();
  final _inputAmountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
    try{

      final newTitle = _inputTitleController.text;
      final newAmount = double.parse(_inputAmountController.text);

      if(newTitle.isEmpty || newAmount <= 0 || _selectedDate == null ){
        return;
      }
      widget.addTransaction(
        newTitle,
        newAmount,
        _selectedDate,
      );

      Navigator.of(context).pop();

    }
    catch(e){}
    return;
  }

  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((pickDate){
      if(pickDate == null){
        return ;
      }
      setState(() {
        _selectedDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      //padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration:KTextFieldDecoration.copyWith(
              hintText: 'Title',
            ),
            controller: _inputTitleController,
            onSubmitted:(_) => _submitData,
          ),
          SizedBox(
            height:7.5,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: KTextFieldDecoration.copyWith(
              hintText: 'Amount',
            ),
            controller: _inputAmountController,
            keyboardType: TextInputType.number,
            onSubmitted:(_) => _submitData,
          ),
          Container(
            height:70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child:Text(
                    _selectedDate == null ?'No Date chosen!please click choose date':'Picked Date:${DateFormat.yMd().format(_selectedDate)}',
                    style:KIntStyle
                  ),
                ),
                FlatButton(
                  child: Text('Choose Date',style: KTextStyle),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
          ),
          RaisedButton(
            color: KCustomGreen,
            child: Text('Add Transaction'),
            onPressed: _submitData
          ),
          SizedBox(
            height:  MediaQuery.of(context).size.height/2.5,
          ),
        ],
      ),
    );
  }
}
