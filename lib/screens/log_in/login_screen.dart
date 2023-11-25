import 'package:flutter/material.dart';
import 'package:todo_app/component/custom_text_form_field.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/screens/sign_up/signup_screen.dart';
import 'package:todo_app/shared/networks/firebase/firebase_manager.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.35),
                  Text(
                    'Welcome back',
                    style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  CustomTextFormField(
                    label: 'Enter your E-mail',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Enter your email';
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                      label: 'Enter your Password',
                      obscuretxt: true,
                      controller: passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter your Password';
                        }
                        return null;
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FirebaseManager.login(
                                emailController.text, passwordController.text,
                                () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.routeName, (Route) => false);
                            }, (message) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text(
                                    'Invalid Email or Password !',
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Try again')),
                                    )
                                  ],
                                ),
                              );
                            });
                          }
                        },
                        child: Text(
                          'Log In',
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.white),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text(
                      'or Create account',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/images/background2.png',
          fit: BoxFit.cover,
          width: mediaQuery.width,
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Align(
            child: Text(
              'Log In',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 25),
            ),
            alignment: Alignment.topCenter,
          ),
        ),
      ]),
    );
  }
}
