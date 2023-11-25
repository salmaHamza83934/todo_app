import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_models.dart';
import 'package:todo_app/shared/networks/firebase/firebase_manager.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add new task',
            style: theme.textTheme.bodyLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              validator: (value) {
                if (value==null) {
                  return 'Task name shouldn\'t be null';
                }
              },
              controller: titleController,
              decoration: InputDecoration(
                label: Text(
                  'Enter your task name',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              validator: (value) {
                if (value==null) {
                  return 'Task description shouldn\'t be null';
                }
              },
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text(
                  'Enter your task description',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('select date'),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              selectDate();
            },
            child: Text(
              selectedDate.toString().substring(0, 10),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                FirebaseManager.addTask(task).then((value) => Navigator.pop(context));
              },
              child: Text('Add Task'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: theme.primaryColor),
            ),
          )
        ],
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xFF5D9CEC),
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!);
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) return;

    selectedDate = chosenDate;
    setState(() {});
  }
}
