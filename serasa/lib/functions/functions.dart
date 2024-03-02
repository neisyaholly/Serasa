import 'package:serasa/classes/user.dart';
import 'package:serasa/service/http_service.dart';

User? currentUser;

Future<dynamic> registerUser(name, tglLahir, telp, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password doesn't match!";
  }

  User user = User(null, name, tglLahir, telp, email, password);

  int? request = await createUser(user);

  if (request == 200) {
    print("User Registered Successfully!");
    return user;
  } else {
    print("Failed To Register!");
    return null;
  }

}

Future<dynamic> loginUser(email, password) async {
  // logika buat input

  User user = User(null, null, null, null, email, password);

  dynamic request = await verifyUser(user);

  if(request is User){
    currentUser = User(request.id, request.name, request.tglLahir, request.telp, request.email, request.password);
    print(currentUser!.id);
    print("User Logged In Successfully!");
    return request;
  }else{
    print("No user found!");
  }
  
  // else if(request == 500){
  //   print("No user found with this email!");
  //   return null;
  // }else{
  //   print("Failed to login! Wrong email or password.");
  //   return null;
  // }
  
}
