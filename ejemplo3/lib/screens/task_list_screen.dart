import 'package:flutter/material.dart';
import '../bloc/task_bloc.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    taskBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: 'Enter a task...',
              ),
              onSubmitted: (taskTitle) {
                taskBloc.addTask(Task(title: taskTitle));
                _taskController.clear();
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Task>>(
              stream: taskBloc.taskListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final task = snapshot.data![index];
                      return ListTile(
                        title: Text(task.title),
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) {
                            taskBloc.toggleTaskCompletion(index);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TaskListScreen(),
    ),
  );
}
