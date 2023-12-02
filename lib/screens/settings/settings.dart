import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/screens/settings/theme_bottom_sheet.dart';


class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Mode',style:theme.textTheme.bodySmall,
          ),
          GestureDetector(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              decoration: BoxDecoration(
                color: provider.theme==ThemeMode.light?Colors.white:Color(0xFF141922),
                  border: Border.all(color: theme.primaryColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.theme == ThemeMode.light
                        ? 'Light'
                        : 'Dark',style: theme.textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down,color: Colors.black,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
