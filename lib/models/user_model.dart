import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String id;
  String name;
  String email;

  UserModel({required this.id,required this.name,required this.email});

  UserModel.fromjson(Map<String,dynamic>json):this(
    id: json['id'],
    name: json['name'],
    email: json['email']
  );

  Map<String,dynamic> tojson(){
    return{
      'id':id,
      'name':name,
      'email':email
    };
  }
}