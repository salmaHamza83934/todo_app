import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/screens/log_in/login_screen.dart';
import 'package:todo_app/screens/sign_up/signup_screen.dart';
import 'package:todo_app/screens/task/edit_task.dart';
import 'package:todo_app/splash_screen/splash_screen.dart';

import 'core/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider provider = ThemeProvider();
  await provider.loadTheme();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MyProvider()),
    ChangeNotifierProvider(create: (context)=>ThemeProvider())
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: provider.theme,
      initialRoute: HomeScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        EditTaskView.routeName: (context) => EditTaskView(),
      },
    );
  }
}
