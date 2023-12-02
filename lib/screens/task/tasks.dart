import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_models.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/screens/task/task_item.dart';
import 'package:todo_app/shared/networks/firebase/firebase_manager.dart';

class Tasks extends StatefulWidget {

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider=Provider.of<ThemeProvider>(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate=date;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor:provider.theme==ThemeMode.light?Colors.black:Colors.white,
          dayColor: provider.theme==ThemeMode.light?Colors.black:Colors.white,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: theme.primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
      ),
      Expanded(child: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseManager.getTask(selectedDate),
          builder:(context,Snapshot) {
            if (Snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Loading',style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),));
            }
            if (Snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            var task=Snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
            return ListView.builder(itemBuilder: (context,index)=>TaskItem(task[index]),itemCount: task.length,);
          }))
    ]);
  }
}
