import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/providers/theme_provider.dart';
import '../../models/task_models.dart';
import '../../shared/networks/firebase/firebase_manager.dart';

class EditTaskView extends StatefulWidget {
  static const String routeName='edit_task';

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate=DateTime.now();

  TaskModel? task;

  @override
  Widget build(BuildContext context) {
    if(task==null){
      task= ModalRoute.of(context)!.settings.arguments as TaskModel;
      selectedDate= DateTime.fromMillisecondsSinceEpoch(task!.date);
      titleController.text=task!.title;
      descriptionController.text=task!.description;
    }
    var theme=Theme.of(context);
    var mediaQuery=MediaQuery.of(context).size;
    var provider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryColor,
        title: Text('ToDo List', style: theme.textTheme.titleLarge),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                color: theme.primaryColor,
                height: mediaQuery.height*0.15,
                width: mediaQuery.width,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: mediaQuery.height*0.05),
                  height: mediaQuery.height*0.7,
                  width: mediaQuery.width*0.8,
                  decoration: BoxDecoration(
                      color: provider.theme==ThemeMode.light?Colors.white:Color(0xFF141922),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Edit task',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value==null || value.isEmpty) {
                                return 'Task name shouldn\'t be null';
                              }
                            },
                            style: TextStyle(color: provider.theme==ThemeMode.light?Colors.black:Colors.white),
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
                              if (value==null || value.isEmpty) {
                                return 'Task description shouldn\'t be null';
                              }
                            },
                            style: TextStyle(color: provider.theme==ThemeMode.light?Colors.black:Colors.white),
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
                              editTask();
                              Future.delayed(Duration(milliseconds: 700),(){
                                Navigator.pushNamed(context, HomeScreen.routeName);
                              });
                            },
                            child: Text('Save Changes'),
                            style:
                            ElevatedButton.styleFrom(backgroundColor: theme.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
  editTask(){
    task!.title=titleController.text;
    task!.description=descriptionController.text;
    task!.date=selectedDate.millisecondsSinceEpoch;
    FirebaseManager.updateTask(task!);

  }
}
