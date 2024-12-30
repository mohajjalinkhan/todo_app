import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/todo_list.dart';

class TodoHomePage extends StatelessWidget {
    TodoHomePage({super.key});
    // added array and set one sample value text = "" and for check box = false 
  List todoList = [

[ "this is first todo in the app", false],
[ "this is second todo in the app", false],
[ "this is third todo in the app", false],
[ "this is second todo in the app", false],
[ "this is third todo in the app", false],

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // added background color
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text(
          "Todo APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      // using len of todo count
       body: ListView.builder(itemCount: todoList.length,
        itemBuilder: ( BuildContext context, index)
      {
        return TodoList(taskName: todoList[index][0]);
       })
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Created first project ",
      //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
