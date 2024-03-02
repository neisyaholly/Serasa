import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serasa/classes/user.dart';

String url = "http://10.0.2.2:8000/api";

Future<int?> createUser(user) async {
  final response = await http.post(
    Uri.parse("$url/register-user"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(user),
  );

  if (response.statusCode == 200) {
    return 200;
  }
  return 400;
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

  // return response.statusCode;
  if(response.statusCode == 200){
    return User.fromJson(jsonDecode(response.body));
  }else if(response.statusCode == 500){
    print("No user found with this email!");
  }else{
    print("Wrong email or password! Please try again");
  }
  
  return null;

}
