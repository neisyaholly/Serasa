import 'dart:async';
import 'package:http/http.dart';
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
import 'package:serasa/service/http_service.dart';
import 'package:serasa/classes/voucher.dart';
import 'package:serasa/classes/voucherUser.dart';
import 'package:serasa/classes/bankSampah.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

User? currentUser;

Future<dynamic> registerUser(
    name, tglLahir, telp, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password doesn't match!";
  }

  User user =
      User(null, name, tglLahir, telp, email, password, null, null, null);
  dynamic request = await createUser(user);

  if (request is User) {
    currentUser = User(
        request.id,
        request.name,
        request.tglLahir,
        request.telp,
        request.email,
        request.password,
        request.poin,
        request.role,
        request.foto);
    print("User Registered Successfully!");
    return request;
  } else {
    print("Failed To Register!");
    return null;
  }
}

Future<dynamic> loginUser(email, password) async {
  User user = User(null, null, null, null, email, password, null, null, null);
  dynamic request = await verifyUser(user);

  if (request is User) {
    currentUser = User(
        request.id,
        request.name,
        request.tglLahir,
        request.telp,
        request.email,
        request.password,
        request.poin,
        request.role,
        request.foto);
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

// Future<dynamic> checkOut(userID, sellerID, pembayaranID, jenis, selesai,
//     List<DetailPesanan> detailPesanan) async {
//   Pesanan pesanan =
//       Pesanan(null, userID, sellerID, pembayaranID, jenis, selesai);

//   List<DetailPesanan> detailPesananList = detailPesanan
//       .map((detail) =>
//           DetailPesanan(null, detail.pesananID, detail.produkID, detail.qty))
//       .toList();

//   dynamic request = await createPesanan(pesanan, detailPesananList);

//   if (request is Pesanan) {
//     print("Order added Successfully!");
//     return request;
//   } else {
//     print("Failed To Checkout!");
//     return null;
//   }
// }

Future<dynamic> checkOutPesanan(
    userID, sellerID, pembayaranID, ongkir, jenis, selesai) async {
  Pesanan pesanan =
      Pesanan(null, userID, sellerID, pembayaranID, ongkir, jenis, selesai);
  dynamic request = await createPesanan(pesanan);

  if (request is Pesanan) {
    print("Pesanan added Successfully!");
    return request;
  } else {
    print("Failed To Checkout Pesanan!");
    return null;
  }
}

Future<dynamic> checkOutDetailPesananKomunitas(pesananID, produkID, qty) async {
  DetailPesanan detailPesanan = DetailPesanan(null, pesananID, produkID, qty);
  dynamic request = await createDetailPesananKomunitas(detailPesanan);

  if (request is DetailPesanan) {
    print("Detail Pesanan added Successfully!");
    return request;
  } else {
    print("Failed To Checkout Detail Pesanan!");
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
    print('Error fetching produk restos: $e');
    return [];
  }
}

Future<List<Keranjang>> fetchKeranjangs() async {
  try {
    List<Keranjang> keranjangs = await getKeranjang();
    print(keranjangs.length);
    return keranjangs;
  } catch (e) {
    print('Error fetching carts: $e');
    return [];
  }
}

Future<List<DetailKeranjang>> fetchDetailKeranjangs() async {
  try {
    List<DetailKeranjang> detailKeranjangs = await getDetailKeranjang();
    print(detailKeranjangs.length);
    return detailKeranjangs;
  } catch (e) {
    print('Error fetching detail carts: $e');
    return [];
  }
}

Future<List<ProdukKomunitas>> fetchProdukKomunitass() async {
  try {
    List<ProdukKomunitas> produkKomunitass = await getProdukKomunitas();
    print(produkKomunitass.length);
    return produkKomunitass;
  } catch (e) {
    print('Error fetching produk komunitas: $e');
    return [];
  }
}

Future<dynamic> addProdukKomunitas(
    userID, nama, harga, exp, deskripsi) async {
  
  ProdukKomunitas pk = ProdukKomunitas(null, userID, nama, deskripsi, harga, exp, null, null, null);
  dynamic request = await createProdukKomunitas(pk);
  print("asdf");
  if (request is ProdukKomunitas) {
    print("ProdukKomunitas added Successfully!");
    return request;
  } else {
    print("ProdukKomunitas Failed!");
    return null;
  }
}

Future<List<Pembayaran>> fetchPembayarans() async {
  try {
    List<Pembayaran> pembayarans = await getPembayaran();
    print(pembayarans.length);
    return pembayarans;
  } catch (e) {
    print('Error fetching restos: $e');
    return [];
  }
}

Future<dynamic> buatKeranjang(userID) async {
  Keranjang keranjang = Keranjang(null, userID);
  dynamic request = await createKeranjang(keranjang);

  if (request is Keranjang) {
    print("Keranjang added Successfully!");
    return request;
  } else {
    print("Failed To added!");
    return null;
  }
}

Future<dynamic> buatDetailKeranjang(List<ProdukResto> produkResto,
    int keranjangID, List<int> quantities) async {
  List<dynamic> result = [];
  List<DetailKeranjang> detailKeranjangs = await fetchDetailKeranjangs();

  for (int i = 0; i < produkResto.length; i++) {
    bool productExists =
        detailKeranjangs.any((detail) => detail.produkID == produkResto[i].id);
    if (quantities[i] > 0 && !productExists) {
      DetailKeranjang? detail =
          DetailKeranjang(null, keranjangID, produkResto[i].id, quantities[i]);
      dynamic request = createDetailKeranjang(detail);
      if (request != null) {
        print("Detail Keranjang added Successfully!");
        result.add(request);
      } else {
        print("Failed To add Detail Keranjang!");
        result.add(null);
      }
    } else if (quantities[i] > 0 && productExists) {
      DetailKeranjang dk = detailKeranjangs.firstWhere(
        (detail) => detail.produkID == produkResto[i].id,
      );
      int newQty = dk.qty! + quantities[i];
      updateQtyDetail(dk.id!, newQty);
      result.add(dk);
    }
  }
  if (result.any((element) => element == null)) {
    return [];
  }
  return result;
}

void updateQtyDetail(int id, int qty) async {
  try {
    updateQtyDetails(id, qty);
    print('Product quantity updated successfully');
  } catch (e) {
    print('Error updating product quantity: $e');
  }
}

Future<List<Alamat>> fetchAlamats() async {
  try {
    List<Alamat> alamats = await getAlamat();
    print(alamats.length);
    return alamats;
  } catch (e) {
    print('Error fetching restos: $e');
    return [];
  }
}

Future<List<Pesanan>> fetchPesanans() async {
  try {
    List<Pesanan> pesanans = await getPesanan();
    print(pesanans.length);
    return pesanans;
  } catch (e) {
    print('Error fetching pesanans: $e');
    return [];
  }
}

Future<List<DetailPesanan>> fetchDetailPesanans() async {
  try {
    List<DetailPesanan> dpesanans = await getDetailPesanan();
    print(dpesanans.length);
    return dpesanans;
  } catch (e) {
    print('Error fetching detail pesanans: $e');
    return [];
  }
}

void updateAlamatUtama(int id, int userID) async {
  try {
    updateAddressUtama(id, userID);
    print('Alamat updated successfully');
  } catch (e) {
    print('Error updating product: $e');
  }
}

Future<dynamic> inputHelp(userID, isi) async {
  Bantuan bantuan = Bantuan(null, userID, isi);
  dynamic request = await createBantuan(bantuan);

  if (request is Bantuan) {
    print("Question Added Successfully!");
    return request;
  } else {
    print("Failed To Ask for help!");
    return null;
  }
}

Future<dynamic> editProfil(name, email, telp, userID) async {
  User user = User(userID, name, null, telp, email, null, null, null, null);
  dynamic request = await updateProfil(user);

  if (request is User) {
    currentUser = User(
        request.id,
        request.name,
        request.tglLahir,
        request.telp,
        request.email,
        request.password,
        request.poin,
        request.role,
        request.foto);
    print("Profile Updated Successfully!");
    return request;
  } else {
    print("Failed To Edit Profil!");
    return null;
  }
}

Future<void> hapusAkun(int id) async {
  try {
    await deleteUser(id);
    print('Acc deleted successfully');
  } catch (e) {
    print('Error deleting acc: $e');
  }
}

Future<dynamic> addPoinQR(userID, poin) async {
  User user = User(userID, null, null, null, null, null, poin, null, null);
  dynamic request = await tambahPoinQR(user);

  if (request is User) {
    currentUser = User(
        request.id,
        request.name,
        request.tglLahir,
        request.telp,
        request.email,
        request.password,
        request.poin,
        request.role,
        request.foto);
    print("Poin by QR Scan Added Successfully!");
    return request;
  } else {
    print("Failed To Add Poin!");
    return null;
  }
}

void updateeJenisPesanan(int id) async {
  try {
    updatePesanan(id);
    print('Pesanan arrived successfully');
  } catch (e) {
    print('Error updating confirmation arrived pesanan : $e');
  }
}

Future<List<Voucher>> fetchVouchers() async {
  try {
    List<Voucher> vouchers = await getVoucher();
    print("successsssssssssssss");
    print(vouchers[0].nama);
    return vouchers;
  } catch (e) {
    print('Error fetching : $e');
    return [];
  }
}

Future<List<VoucherUser>> fetchVoucherUser() async {
  try {
    List<VoucherUser> voucherUser = await getVoucherUser();
    print("successsssssssssssss");
    print(voucherUser[0].userID);
    return voucherUser;
  } catch (e) {
    print('Error fetching : $e');
    return [];
  }
}

void updateVoucherUsers(int id) async {
  // final int voucherId = 123; // Your voucher ID

  try {
    updateVoucherUser(id); // Await the updateVoucherUser method call
    print('Voucher user updated successfully');
  } catch (e) {
    print('Error updating voucher user: $e');
  }
}

Future<List<RiwayatTukarSampah>> fetchRiwayatTukarSampah() async {
  try {
    List<RiwayatTukarSampah> riwayatTukarSampah = await fetchRiwayatTukarSampahFromAPI();
    print("Success");
    print(riwayatTukarSampah[0].berat);
    return riwayatTukarSampah;
  } catch (e) {
    print('Error fetching: $e');
    return [];
  }
}

Future<List<BankSampah>> fetchBankSampah() async {
  try {
    final response = await fetchBankSampahFromAPI();
    print("Success");
    print(response);
    return response;
  } catch (e) {
    print('Error fetching: $e');
    throw e; // Rethrow the exception to handle it elsewhere if needed
  }
}

Future<List<Map<String, dynamic>>> fetchBankSampahMap() async {
  try {
    final List<BankSampah> bankSampahList = await fetchBankSampahFromAPI();
    // Convert BankSampah objects to Map<String, dynamic> objects
    final List<Map<String, dynamic>> mappedList = bankSampahList.map((bankSampah) {
      return bankSampah.toJson(); // Use the toJson() method directly
    }).toList();
    return mappedList;
  } catch (e) {
    print('Error fetching: $e');
    throw e; // Rethrow the exception to handle it elsewhere if needed
  }
}

Future<void> createVoucherUserEntry(Voucher voucher, int userId) async {
  final response = await post(
    Uri.parse("$url/create-voucher-user"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(<String, dynamic>{
      "id": voucher.id,
      "userID": userId,
      "terpakai": 0, // Set the 'terpakai' value to 0
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to create voucher user entry');
  }
}

Future<void> updateUserPoin(int userId, int poin) async {
  final response = await put(
    Uri.parse("$url/update-user-poin/$userId"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode(<String, dynamic>{
      "poin": poin, // Set the updated poin value
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update user poin');
  }
}