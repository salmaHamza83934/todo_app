import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 'Light',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: provider.theme == ThemeMode.dark
                        ? Colors.white
                        : Color(0xFF141922),
                  ),
                ),
                provider.theme == ThemeMode.light
                    ? Icon(
                        Icons.done,
                        color: theme.primaryColor,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/15,),
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.theme == ThemeMode.dark
                            ? Colors.white
                            : Color(0xFF141922),
                      ),
                ),
                provider.theme == ThemeMode.dark
                    ? Icon(
                        Icons.done,
                        color: theme.colorScheme.secondary,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
