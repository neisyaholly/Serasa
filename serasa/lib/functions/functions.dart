import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/keranjang.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/classes/user.dart';
import 'package:serasa/service/http_service.dart';

User? currentUser;

Future<dynamic> registerUser(
    name, tglLahir, telp, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password doesn't match!";
  }

  User user = User(null, name, tglLahir, telp, email, password, null, null);
  dynamic request = await createUser(user);

  if (request is User) {
    currentUser = User(request.id, request.name, request.tglLahir, request.telp,
        request.email, request.password, request.poin, request.role);
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

  if (request is User) {
    currentUser = User(request.id, request.name, request.tglLahir, request.telp,
        request.email, request.password, request.poin, request.role);
    print(currentUser!.id);
    print("User Logged In Successfully!");
    return request;
  } else {
    print("No user found!");
  }
}

Future<dynamic> addAlamat(
    nama, jalan, kel, kec, kab_kota, provinsi, kode_pos, userID) async {
  Alamat alamat = Alamat(
      null, nama, jalan, kel, kec, kab_kota, provinsi, kode_pos, userID, null);
  dynamic request = await createAlamat(alamat);

  if (request is Alamat) {
    print("Address added Successfully!");
    return request;
  } else {
    print("Failed To Register!");
    return null;
  }
}

Future<dynamic> checkOut(userID, sellerID, pembayaranID, jenis, selesai,
    List<Map<String, dynamic>> detailPesanan) async {
  Pesanan pesanan =
      Pesanan(null, userID, sellerID, pembayaranID, jenis, selesai);

  List<DetailPesanan> detailPesananList = detailPesanan
      .map((detail) => DetailPesanan(
          null, detail['pesananID'], detail['produkID'], detail['qty']))
      .toList();

  dynamic request = await createPesanan(pesanan, detailPesananList);

  if (request is Pesanan) {
    print("Order added Successfully!");
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

Future<List<ProdukResto>> fetchProdukRestos() async {
  try {
    List<ProdukResto> produkRestos = await getProdukResto();
    print(produkRestos.length);
    return produkRestos;
  } catch (e) {
    print('Error fetching restos: $e');
    return [];
  }
}

Future<List<Keranjang>> fetchKeranjangs() async {
  try {
    List<Keranjang> keranjangs = await getKeranjang();
    print(keranjangs.length);
    return keranjangs;
  } catch (e) {
    print('Error fetching restos: $e');
    return [];
  }
}

Future<List<DetailKeranjang>> fetchDetailKeranjangs() async {
  try {
    List<DetailKeranjang> detailKeranjangs = await getDetailKeranjang();
    print(detailKeranjangs.length);
    return detailKeranjangs;
  } catch (e) {
    print('Error fetching restos: $e');
    return [];
  }
}

Future<dynamic> createKeranjang(userID,
    List<Map<String, dynamic>> detailKeranjang) async {
  Keranjang keranjang =
      Keranjang(null, userID);

  List<DetailKeranjang> detailKeranjangList = detailKeranjang
      .map((detail) => DetailKeranjang(
          null, detail['keranjangID'], detail['produkID'], detail['qty']))
      .toList();

  dynamic request = await createKeranjang(keranjang, detailKeranjangList);

  if (request is Keranjang) {
    print("Keranjang added Successfully!");
    return request;
  } else {
    print("Failed To added!");
    return null;
  }
}


