import 'dart:async';

import '../models/task.dart';

class TaskBloc {
  final _taskListController = StreamController<List<Task>>.broadcast();

  List<Task> _tasks = [];

  Stream<List<Task>> get taskListStream => _taskListController.stream;

  void addTask(Task task) {
    _tasks.add(task);
    _taskListController.sink.add(_tasks);
  }

  void toggleTaskCompletion(int index) {
    _tasks[index] = Task(
      title: _tasks[index].title,
      isCompleted: !_tasks[index].isCompleted,
    );
    _taskListController.sink.add(_tasks);
  }

  void dispose() {
    _taskListController.close();
  }
}

final taskBloc = TaskBloc();
