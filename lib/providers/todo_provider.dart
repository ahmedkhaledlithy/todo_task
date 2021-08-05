import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_task/models/todo_model.dart';

class TodoProvider extends ChangeNotifier{
  List<TodoModel> _todos=[
    TodoModel(id: 1, title: "First Todo", content: "My first todo"),
  ];




  UnmodifiableListView<TodoModel> get allTodos => UnmodifiableListView(_todos);
  UnmodifiableListView<TodoModel> get incompleteTodos =>
      UnmodifiableListView(_todos.where((todo) => !todo.isComplete));
  UnmodifiableListView<TodoModel> get completeTodos =>
      UnmodifiableListView(_todos.where((todo) => todo.isComplete));


  void addTodo(TodoModel todo){
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }


  void toggleTodoStatus(int id) {
    var index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isComplete = !_todos[index].isComplete;
    notifyListeners();
  }


}