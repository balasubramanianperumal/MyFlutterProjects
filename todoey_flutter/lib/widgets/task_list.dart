import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/module/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder:(context,taskData,child){
        return ListView.builder(itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(
            taskTile: task.name,
            isValue: task.isDone,
            onChanged: (newValue){
              taskData.updateTask(task);
            },
            onLongPressCallBack:(){
              taskData.deleteTask(task);
            },
          );
        },
          itemCount:taskData.taskLength,
        );
      }
    );
  }
}