import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/component/custom_text_form_field.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/screens/log_in/login_screen.dart';
import 'package:todo_app/shared/networks/firebase/firebase_manager.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.height * 0.35),
                  CustomTextFormField(
                      label: 'Enter your Name',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter your name';
                        }
                        return null;
                      }),
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
                        if(text.length<6){
                          return 'password should be at least 6 characters';
                        }
                        return null;
                      }),
                  CustomTextFormField(
                      label: 'Confirm your Password',
                      obscuretxt: true,
                      controller: confirmPasswordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Confirm your Password';
                        }
                        if (text!=passwordController.text) {
                          return 'Password doesn\'t match';
                        }
                        return null;
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            FirebaseManager.createAccount(nameController.text,emailController.text, passwordController.text, (){
                              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                            });
                          }
                        },
                        child: Text(
                          'Create account',
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.white),
                        )),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text('Already have an account?',textAlign: TextAlign.center,style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),),
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
              'Sign in',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 25),
            ),
            alignment: Alignment.topCenter,
          ),
        ),
      ]),
    );
  }
}
