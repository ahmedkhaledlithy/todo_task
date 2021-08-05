import 'package:flutter/material.dart';
import 'package:todo_task/constants/colors.dart';

class TodoItem extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final TextDecoration? decoration;
  final VoidCallback? onPressed;


  TodoItem({required this.value, this.onChanged,required this.title, this.decoration, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(value: value,
      onChanged: onChanged,
      title: Text(title,style: TextStyle(decoration: decoration),),
      controlAffinity: ListTileControlAffinity.leading,
      secondary: IconButton(onPressed: onPressed, icon: Icon(Icons.delete,color: redColor,)),
    );
  }
}
