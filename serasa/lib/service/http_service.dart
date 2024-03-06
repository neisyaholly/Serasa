import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/keranjang.dart';
import 'package:serasa/classes/pembayaran.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
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

  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else {
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

  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    var userData = responseBody['user'];
    return User.fromJson(userData);
    // return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 500) {
    print("No user found with this email!");
  } else {
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

  if (response.statusCode == 200) {
    return Alamat.fromJson(jsonDecode(response.body));
  } else {
    print("Adding address failed!");
  }

  return null;
}

Future<Pesanan?> createPesanan(
    pesanan, List<DetailPesanan> detailPesanan) async {
  final requestData = {
    "pesanan": pesanan.toJson(),
    "detailPesanan": detailPesanan.map((detail) => detail.toJson()).toList(),
  };

  final response = await http.post(
    Uri.parse("$url/create-pesanan"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    return Pesanan.fromJson(jsonDecode(response.body));
  } else {
    print("Adding pesanan failed!");
  }

  return null;
}

Future<Pesanan?> updatePesanan(pesanan) async {
  final response = await http.put(
    Uri.parse("$url/update-pesanan"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(pesanan),
  );

  if (response.statusCode == 200) {
    return Pesanan.fromJson(jsonDecode(response.body));
  } else {
    print("Updating pesanan failed!");
  }

  return null;
}

Future<List<Resto>> getResto() async {
  final response = await http.get(
    Uri.parse("$url/get-resto"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => Resto.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load restos');
  }
}

Future<List<ProdukResto>> getProdukResto() async {
  final response = await http.get(
    Uri.parse("$url/get-produkResto"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => ProdukResto.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load produk restos');
  }
}

Future<List<Keranjang>> getKeranjang() async {
  final response = await http.get(
    Uri.parse("$url/get-keranjang"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => Keranjang.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load carts');
  }
}

Future<List<DetailKeranjang>> getDetailKeranjang() async {
  final response = await http.get(
    Uri.parse("$url/get-detailKeranjang"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => DetailKeranjang.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load carts');
  }
}

Future<List<Pembayaran>> getPembayaran() async {
  final response = await http.get(
    Uri.parse("$url/get-pembayaran"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => Pembayaran.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load carts');
  }
}
