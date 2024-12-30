import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskComplited,
      required this.onChange,
      required this.deleteFunction});
  final String taskName;
  final bool taskComplited;
  final Function(bool?)? onChange;
  final Function(BuildContext) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.red.shade200,
            
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple.shade900,
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                  value: taskComplited,
                  onChanged: onChange,
                  side: BorderSide(color: Colors.white)),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    decoration: taskComplited
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
