import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/constants/colors.dart';
import 'package:todo_task/providers/todo_provider.dart';
import 'package:todo_task/widgets/todo_item.dart';

class InCompleteTodos extends StatelessWidget {
  const InCompleteTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<TodoProvider>(
      builder: (context, todos, child) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        separatorBuilder: (context,index){
          return Divider(color: grey700Color,);
        },
        itemCount: todos.incompleteTodos.length,
        itemBuilder: (context,index){
          return TodoItem(
            value: todos.incompleteTodos[index].isComplete,
            title: todos.incompleteTodos[index].title,
            onChanged: (val){
              todos.toggleTodoStatus(todos.incompleteTodos[index].id!);
            },
            onPressed: (){
              todos.removeTodo(todos.incompleteTodos[index].id!);
            },
          );
        },
      ),
    );

  }
}
