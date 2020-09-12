import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isValue;
  final String taskTile;
  final Function onChanged;
  final Function onLongPressCallBack;

  TaskTile({this.isValue, this.taskTile, this.onChanged ,this.onLongPressCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallBack,
        title: Text(
          taskTile,
          style: TextStyle(
            decoration: isValue ? TextDecoration.lineThrough: null,
          ),
        ),
        trailing:Checkbox(
          value: isValue,
          activeColor: Colors.lightBlueAccent.shade200,
          onChanged:onChanged,
          ),
    );
  }
}



