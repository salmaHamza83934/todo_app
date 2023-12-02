import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_models.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/screens/task/edit_task.dart';
import 'package:todo_app/shared/networks/firebase/firebase_manager.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var provider=Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(EditTaskView.routeName,arguments: task);
        },
        child: Container(
          height: mediaQuery.height * 0.12,
          width: mediaQuery.width * 0.7,
          decoration: BoxDecoration(
            color: provider.theme==ThemeMode.light?Colors.white:Color(0xFF141922),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Slidable(
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  flex: 1,
                  onPressed: (context) {
                    FirebaseManager.deleteTask(task.id);
                  },
                  backgroundColor: Colors.red,
                  label: 'Delete',
                  icon: Icons.delete,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    height: mediaQuery.height * 0.07,
                    width: 7,
                    decoration: BoxDecoration(
                        color: task.isDone?Colors.green:theme.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      task.title,
                      style: theme.textTheme.bodyMedium!.copyWith(color: task.isDone?Colors.green:theme.primaryColor),
                    ),
                    Text(
                      task.description,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    task.isDone=!task.isDone;
                    FirebaseManager.updateTask(task);
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color:
                          task.isDone ? Colors.transparent : theme.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: task.isDone
                        ? Text(
                            'Done!',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Colors.green),
                          )
                        : Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
