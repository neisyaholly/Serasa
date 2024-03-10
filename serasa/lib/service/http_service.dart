import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/keranjang.dart';
import 'package:serasa/classes/pembayaran.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
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

Future<Pesanan?> createPesanan(Pesanan pesanan) async {
  final response = await http.post(
    Uri.parse("$url/create-pesanan"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(pesanan),
  );

  if (response.statusCode == 200) {
    return Pesanan.fromJson(jsonDecode(response.body));
  } else {
    print("Adding pesanan failed!");
  }

  return null;
}

Future<DetailPesanan?> createDetailPesanan(
    List<DetailPesanan> detailPesanans) async {
  final response = await http.post(
    Uri.parse("$url/create-detailPesanan"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(
        detailPesanans.map((detailPesanan) => detailPesanan.toJson()).toList()),
  );

  if (response.statusCode == 200) {
    print("Detail pesanan added successfully!");
    return DetailPesanan.fromJson(jsonDecode(response.body));
  } else {
    print("Adding detail pesanan failed!");
    return null;
  }
}

Future<DetailPesanan?> createDetailPesananKomunitas(
    DetailPesanan detailPesanan) async {
  final response = await http.post(
    Uri.parse("$url/create-detailPesananKomunitas"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(detailPesanan),
  );

  if (response.statusCode == 200) {
    return DetailPesanan.fromJson(jsonDecode(response.body));
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

Future<Keranjang?> createKeranjang(
    Keranjang, List<DetailPesanan> detailKeranjang) async {
  final requestData = {
    "keranjang": Keranjang.toJson(),
    "detailKeranjang":
        detailKeranjang.map((detail) => detail.toJson()).toList(),
  };

  final response = await http.post(
    Uri.parse("$url/create-keranjang"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    return Keranjang.fromJson(jsonDecode(response.body));
  } else {
    print("Adding keranjang failed!");
  }

  return null;
}

Future<void> updateQtyDetail(int id) async {
  try {
    final response = await http.put(
      Uri.parse('$url/update-qtyDetail/id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Product quantity updated successfully');
    } else if (response.statusCode == 500) {
      throw Exception('Failed to update product quantity: ${response.body}');
    } else {
      throw Exception('Unexpected error occurred: ${response.statusCode}');
    }
  } catch (e) {
    print('Error updating product quantity: $e');
    throw e;
  }
}

Future<void> updateProductCart(int id) async {
  try {
    final response = await http.put(
      Uri.parse('$url/updateProductCart/id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Product updated successfully');
    } else if (response.statusCode == 500) {
      throw Exception('Failed to update product: ${response.body}');
    } else {
      throw Exception('Unexpected error occurred: ${response.statusCode}');
    }
  } catch (e) {
    print('Error updating product: $e');
    throw e;
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

Future<List<ProdukKomunitas>> getProdukKomunitas() async {
  final response = await http.get(
    Uri.parse("$url/get-komunitas"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  print(response);

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => ProdukKomunitas.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load produk komunitas');
  }
}

Future<List<Alamat>> getAlamat() async {
  final response = await http.get(
    Uri.parse("$url/get-address"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => Alamat.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load alamats');
  }
}

Future<List<Pesanan>> getPesanan() async {
  final response = await http.get(
    Uri.parse("$url/get-pesanan"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => Pesanan.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load alamats');
  }
}

Future<ProdukKomunitas?> createProdukKomunitas(pk) async {
  final response = await http.post(
    Uri.parse("$url/create-komunitas"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(pk),
  );
  // print(pk);
  if (response.statusCode == 200) {
    // print("asdf");
    return ProdukKomunitas.fromJson(jsonDecode(response.body));
  } else {
    print("failed!");
  }

  return null;
}