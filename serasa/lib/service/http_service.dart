import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/user.dart';

String url = "http://10.0.2.2:8000/api";

Future<User?> createUser(user) async {
  final response = await http.post(
    Uri.parse("$url/register-user"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(user),
  );

  if(response.statusCode == 201){
    return User.fromJson(jsonDecode(response.body));
  }else{
    print("Register failed!");
  }
  
  return null;

}

Future<User?> verifyUser(user) async {
  final response = await http.post(
    Uri.parse("$url/login-user"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(user),
  );

  if(response.statusCode == 200){
    var responseBody = jsonDecode(response.body);
    var userData = responseBody['user'];
    return User.fromJson(userData);
    // return User.fromJson(jsonDecode(response.body));
  }else if(response.statusCode == 500){
    print("No user found with this email!");
  }else{
    print("Wrong email or password! Please try again");
  }
  
  return null;

}

Future<Alamat?> createAlamat(alamat) async {
  final response = await http.post(
    Uri.parse("$url/add-address"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(alamat),
  );

  if(response.statusCode == 200){
    return Alamat.fromJson(jsonDecode(response.body));
  }else{
    print("Adding address failed!");
  }
  
  return null;

}