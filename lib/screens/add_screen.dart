import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/constants/colors.dart';
import 'package:todo_task/models/todo_model.dart';
import 'package:todo_task/providers/todo_provider.dart';
import 'package:todo_task/widgets/custom_text_form.dart';

class AddEditScreen extends StatefulWidget {
  const AddEditScreen({Key? key}) : super(key: key);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {


  late TextEditingController titleController;
  late TextEditingController contentController;
  final _formKey = GlobalKey<FormState>();
  bool completedTodo = false;

  @override
  void initState() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos= Provider.of<TodoProvider>(context, listen: false).allTodos;

    return Scaffold(
      appBar: AppBar(
        title: Text("ADD TODO"),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextForm(label: 'Title', validMessage: 'Enter Your Todo Title',controller: titleController,),
             SizedBox(height: 20,),
              CustomTextForm(label: 'Content', validMessage: 'Enter Your Todo Content',controller: contentController,),
              SizedBox(height: 20,),
              Row(
                children: [
                  Checkbox(
                      activeColor: primaryColor,
                      value: completedTodo,
                      onChanged: (bool? value) {
                        setState(() {
                          completedTodo = value!;
                        });
                      }),
                  Text("COMPLETE?",
                    style: TextStyle(color: blackColor, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 70,),
              Container(
                width: double.infinity,
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  child: Text("ADD",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.1,
                    ),
                  ),
                  onPressed: ()  {
                     if (_formKey.currentState!.validate()) {
                      Provider.of<TodoProvider>(context, listen: false).addTodo(
                          TodoModel(
                            id:todos.last.id! + 1,
                            title: titleController.text,
                            content: contentController.text,
                            isComplete: completedTodo
                          ),
                      );
                       Navigator.pop(context);
                     }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
