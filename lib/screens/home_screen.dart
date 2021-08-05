import 'package:flutter/material.dart';
import 'package:todo_task/constants/colors.dart';
import 'package:todo_task/screens/add_screen.dart';
import 'package:todo_task/screens/home_tabs/all_todos.dart';
import 'package:todo_task/screens/home_tabs/complete.dart';
import 'package:todo_task/screens/home_tabs/incomplete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0,length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Todos"),
        actions:[
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEditScreen()));
          }),
        ],
        bottom: TabBar(
          indicatorColor: whiteColor,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "ALL",
            ),
            Tab(
              icon: Icon(Icons.do_not_disturb_off),
              text: "INCOMPLETE",
            ),
            Tab(
              icon: Icon(Icons.done),
              text: "COMPLETE",
            ),

          ],
          controller: tabController,
        ),
      ),
      body: TabBarView(
        children: [
        AllTodos(),
        InCompleteTodos(),
        CompleteTodos(),
      ],
        controller: tabController,
      ),
    );
  }
}
