import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_models.dart';

import '../../../models/user_model.dart';

class FirebaseManager{

  static CollectionReference<TaskModel> getTaskCollection(){
    return FirebaseFirestore.instance.collection('Tasks').withConverter<TaskModel>(fromFirestore: (snapshot,_){
      return TaskModel.fromjson(snapshot.data()!);
    }, toFirestore: (task,_){
      return task.tojson();
    });
}

  static Future<void> addTask(TaskModel task){
    var collection=getTaskCollection();
    var docRef=collection.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date){
   return getTaskCollection().where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).where('date',isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(String taskId){
    return getTaskCollection().doc(taskId).delete();
  }

  static Future<void> updateTask(TaskModel task){
    return getTaskCollection().doc(task.id).update(task.tojson());
  }


  static CollectionReference<UserModel> getUserCollection(){
    return FirebaseFirestore.instance.collection('Users').withConverter<UserModel>(fromFirestore: (snapshot,_){
      return UserModel.fromjson(snapshot.data()!);
    }, toFirestore: (user,_){
      return user.tojson();
    });
  }

  static Future<void> addUserToFirestore(UserModel user){
    var collection=getUserCollection();
    var docRef=collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<UserModel?> getUser(String id) async{
    DocumentSnapshot<UserModel> userDoc=await getUserCollection().doc(id).get();
   return userDoc.data();
  }

  static Future<void> createAccount(String name,String email,String password,Function onSuccess)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user=UserModel(id: credential.user!.uid, name: name, email: email);
      addUserToFirestore(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> login(String email,String password,Function onSuccess,Function onError)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
}