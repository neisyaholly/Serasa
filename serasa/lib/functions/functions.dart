import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/classes/user.dart';
import 'package:serasa/service/http_service.dart';

User? currentUser;

Future<dynamic> registerUser(name, tglLahir, telp, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password doesn't match!";
  }

  User user = User(null, name, tglLahir, telp, email, password, null, null);
  dynamic request = await createUser(user);

  if (request is User) {
    currentUser = User(request.id, request.name, request.tglLahir, request.telp, request.email, request.password, request.poin, request.role);
    print("User Registered Successfully!");
    return request;
  } else {
    print("Failed To Register!");
    return null;
  }
}

Future<dynamic> loginUser(email, password) async {
  // logika buat input
  User user = User(null, null, null, null, email, password, null, null);
  dynamic request = await verifyUser(user);

  if(request is User){
    currentUser = User(request.id, request.name, request.tglLahir, request.telp, request.email, request.password, request.poin, request.role);
    print(currentUser!.id);
    print("User Logged In Successfully!");
    return request;
  }else{
    print("No user found!");
  }
}

Future<dynamic> addAlamat(nama, jalan, kel, kec, kab_kota, provinsi, kode_pos, userID) async {

  Alamat alamat = Alamat(null, nama, jalan, kel, kec, kab_kota, provinsi, kode_pos, userID, null);
  dynamic request = await createAlamat(alamat);

  if (request is Alamat) {
    print("Address added Successfully!");
    return request;
  } else {
    print("Failed To Register!");
    return null;
  }
}

Future<List<Resto>> fetchRestos() async {
    try {
      List<Resto> restos = await getResto();
      print(restos.length);
      return restos;
    } catch (e) {
      print('Error fetching restos: $e');
      return [];
    }
  }
