import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/todo_list.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
// added controller to take user input
  final _controller = TextEditingController();

  // added array and set one sample value text = "" and for check box = false
  List todoList = [
    ["this is first todo in the app", false],
  ];

  // check box function
  void chekBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
      // clearing old text store in side _controller
      _controller.clear();
    });
  }

  // adding add todo funcnality
  void addNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
  }
  // deleteTask function
  void deleteTasks(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
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
            deleteFunction: (context) => deleteTasks(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              // text field to store user text
              child: TextField(
                controller: _controller,
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
