import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/bantuan.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/keranjang.dart';
import 'package:serasa/classes/pembayaran.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/classes/riwayatTukarSampah.dart';
import 'package:serasa/classes/user.dart';
import 'package:serasa/classes/voucher.dart';
import 'package:serasa/classes/voucherUser.dart';
import 'package:serasa/classes/bankSampah.dart';

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
    print("Adding pesanan resto failed!");
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
    print("Adding detail pesanan resto failed!");
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
    print("Adding pesanan komunitas failed!");
  }

  return null;
}

Future<Pesanan?> updatePesanan(int id) async {
  final response = await http.put(
    Uri.parse("$url/update-pesanan/$id"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    // body: jsonEncode(pesanan),
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

Future<Keranjang?> createKeranjang(keranjang) async {
  final response = await http.post(
    Uri.parse("$url/create-keranjang"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(keranjang),
  );
  if (response.statusCode == 200) {
    return Keranjang.fromJson(jsonDecode(response.body));
  } else {
    print("Adding keranjang failed!");
  }
  return null;
}

Future<DetailKeranjang?> createDetailKeranjang(detailKeranjang) async {
  final response = await http.post(
    Uri.parse("$url/create-detailKeranjang"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(detailKeranjang),
  );
  if (response.statusCode == 200) {
    print("Detail keranjang added successfully!");
    return DetailKeranjang.fromJson(jsonDecode(response.body));
  } else {
    print("Adding detail keranjang failed!");
    return null;
  }
}

Future<void> updateQtyDetails(int id, int qty) async {
  final response = await http.put(
    Uri.parse('$url/update-qtyDetail/$id/$qty'),
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
    throw Exception('Failed to load detail carts');
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
    throw Exception('Failed to load payments');
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
    throw Exception('Failed to load pesanans');
  }
}

Future<List<DetailPesanan>> getDetailPesanan() async {
  final response = await http.get(
    Uri.parse("$url/get-detailPesanan"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => DetailPesanan.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load detail pesanans');
  }
}

Future<void> updateAddressUtama(int id, int userID) async {
  try {
    final response = await http.put(
      Uri.parse('$url/update-utama/$id/$userID'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Alamat utama updated successfully');
    } else if (response.statusCode == 500) {
      throw Exception('Failed to update alamat utama: ${response.body}');
    } else {
      throw Exception('Unexpected error occurred: ${response.statusCode}');
    }
  } catch (e) {
    print('Error updating alamat utama: $e');
    throw e;
  }
}

Future<Bantuan?> createBantuan(bantuan) async {
  final response = await http.post(
    Uri.parse("$url/input-help"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(bantuan),
  );

  if (response.statusCode == 200) {
    return Bantuan.fromJson(jsonDecode(response.body));
  } else {
    print("Added question failed!");
  }
  return null;
}

Future<User?> updateProfil(user) async {
  final response = await http.post(
    Uri.parse("$url/edit-profil"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(user),
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    print("Edit profil failed!");
    return null;
  }
}

Future<void> deleteUser(int id) async {
  final response = await http.delete(
    Uri.parse("$url/deleteUser/$id"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );
  if (response.statusCode == 200) {
    print('User deleted successfully');
  } else {
    print('Failed to delete user: ${response.statusCode}');
  }
}

Future<User?> tambahPoinQR(user) async {
  final response = await http.post(
    Uri.parse("$url/poin-qr"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(user),
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    print("Add Ppin by QR failed!");
    return null;
  }
}

Future<List<Voucher>> getVoucher() async {
  final response = await http.get(
    Uri.parse("$url/get-voucher"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => Voucher.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load vouchers');
  }
}

Future<List<VoucherUser>> getVoucherUser() async {
  final response = await http.get(
    Uri.parse("$url/get-voucherUser"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => VoucherUser.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load voucher user');
  }
}

Future<void> updateVoucherUser(int id) async {
  try {
    final response = await http.put(
      Uri.parse('$url/updateVoucherUser/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Voucher user updated successfully');
    } else if (response.statusCode == 500) {
      throw Exception('Failed to update voucher user: ${response.body}');
    } else {
      throw Exception('Unexpected error occurred: ${response.statusCode}');
    }
  } catch (e) {
    print('Error updating voucher user: $e');
    throw e; // Rethrow the exception for handling it outside
  }
}

Future<List<RiwayatTukarSampah>> fetchRiwayatTukarSampahFromAPI() async {
  final response = await http.get(
    Uri.parse("$url/get-riwayatTukarSampah"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    Iterable data = json.decode(response.body);
    return data.map((json) => RiwayatTukarSampah.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load riwayat tukar sampah');
  }
}

Future<List<BankSampah>> fetchBankSampahFromAPI() async {
  final response = await http.get(
    Uri.parse("$url/get-bankSampah"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => BankSampah.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load bank sampah');
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