import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/constants/colors.dart';
import 'package:todo_task/providers/todo_provider.dart';
import 'package:todo_task/widgets/todo_item.dart';

class AllTodos extends StatelessWidget {
  const AllTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<TodoProvider>(
      builder: (context, todos, child) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        separatorBuilder: (context,index){
          return Divider(color: grey700Color,);
        },
        itemCount: todos.allTodos.length,
        itemBuilder: (context,index){
         return TodoItem(
           value: todos.allTodos[index].isComplete,
           title: todos.allTodos[index].title,
           decoration: todos.allTodos[index].isComplete==true?TextDecoration.lineThrough:TextDecoration.none,
           onChanged: (val){
             todos.toggleTodoStatus(todos.allTodos[index].id!);
           },
           onPressed: (){
             todos.removeTodo(todos.allTodos[index].id!);
           },
         );
        },
      ),
    );
  }
}

