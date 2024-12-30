import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/todo_list.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  // added array and set one sample value text = "" and for check box = false
  List todoList = [
    ["this is first todo in the app", false],
    ["this is second todo in the app", false],
  ];

  // check box function
  void chekBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  // adding add todo funcnality

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // added background color
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Todo APP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      // using len of todo count
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: todoList[index][0],
            taskComplited: todoList[index][1],
            onChange: (value) => chekBoxChanged(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Add todo items",
                  filled: true,
                  fillColor: Colors.purple.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade900),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple.shade900),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: addNewTask,
            child: Icon(
              Icons.add_box_rounded,
              color: Colors.purple.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
