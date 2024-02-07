import 'package:serasa/classes/user.dart';
import 'package:serasa/service/http_service.dart';

Future<dynamic> registerUser(name, tglLahir, telp, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password doesn't match!";
  }

  User user = User(name, tglLahir, telp,, password);

  int? request = await createUser(user);

  if (request == 200) {
    print("User Registered Successfully!");
    return user;
  } else {
    print("Failed To Register!");
    return null;
  }

}

Future<User?> loginUser(email, password) async {
  // logika buat input

  User user = User(null, null, null, email, password);

  int? request = await verifyUser(user);

  if(request == 200){
    print("User Logged In Successfully!");
    return user;
  }else{
    print("Failed To Log In!");
    return null;
  }
  
}
