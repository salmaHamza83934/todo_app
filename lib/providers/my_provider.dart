import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/networks/firebase/firebase_manager.dart';

import '../models/user_model.dart';

class MyProvider extends ChangeNotifier{
    UserModel? userModel;
    User? firebaseUser;

    MyProvider(){
      firebaseUser=FirebaseAuth.instance.currentUser;
      if(firebaseUser!=null){
        initUser();
      }
    }

   initUser() async{
      userModel=await FirebaseManager.getUser(firebaseUser!.uid);
      notifyListeners();
  }

}