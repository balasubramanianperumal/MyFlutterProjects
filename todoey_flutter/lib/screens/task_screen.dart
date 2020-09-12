import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'add_task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/module/task_data.dart';
class TasksScreen extends StatelessWidget {

  String singular = 'Task';
  String plural = 'Tasks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade200,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent.shade200,
        child: Icon(
          Icons.add,
          size: 35.0,
        ),
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder:(BuildContext context)=> SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTask(),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 60.0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.format_list_bulleted,
                      size: 35.0,
                      color: Colors.lightBlueAccent.shade200,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskLength > 1 ? plural : singular} remaining',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




