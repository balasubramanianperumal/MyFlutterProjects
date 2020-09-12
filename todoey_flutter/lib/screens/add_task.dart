import 'package:flutter/material.dart';
import 'package:todoey_flutter/module/task_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    String newTaskTitle;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF757575),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent.shade200,
              ),
            ),
            TextField(
              controller: fieldController,
              autofocus:true,
              textAlign: TextAlign.center,
              onChanged: (newValue){
                newTaskTitle = newValue;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent.shade200,
              child:Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              onPressed:(){
                fieldController.clear();
                Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
    );
  }
}
