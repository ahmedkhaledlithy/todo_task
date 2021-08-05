import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/constants/colors.dart';
import 'package:todo_task/providers/todo_provider.dart';
import 'package:todo_task/widgets/todo_item.dart';

class CompleteTodos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Consumer<TodoProvider>(
      builder:(context, todos, child)=> ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        separatorBuilder: (context,index){
          return Divider(color: grey700Color,);
        },
        itemCount: todos.completeTodos.length,
        itemBuilder: (context,index){
          return TodoItem(
            value: todos.completeTodos[index].isComplete,
            title: todos.completeTodos[index].title,
            decoration: TextDecoration.lineThrough,
            onChanged: (val){
              todos.toggleTodoStatus(todos.completeTodos[index].id!);
            },
            onPressed: (){
              todos.removeTodo(todos.completeTodos[index].id!);
            },
          );
        },
      ),
    );

  }
}
