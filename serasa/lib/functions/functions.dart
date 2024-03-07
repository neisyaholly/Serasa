import 'dart:async';
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

User? currentUser;

Future<dynamic> registerUser(
    name, tglLahir, telp, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password doesn't match!";
  }

  User user = User(null, name, tglLahir, telp, email, password, null, null, null);
  dynamic request = await createUser(user);

  if (request is User) {
    currentUser = User(request.id, request.name, request.tglLahir, request.telp,
    request.email, request.password, request.poin, request.role, request.foto);
    print("User Registered Successfully!");
    return request;
  } else {
    print("Failed To Register!");
    return null;
  }
}

Future<dynamic> loginUser(email, password) async {
  // logika buat input
  User user = User(null, null, null, null, email, password, null, null, null);
  dynamic request = await verifyUser(user);

  if (request is User) {
    currentUser = User(request.id, request.name, request.tglLahir, request.telp,
        request.email, request.password, request.poin, request.role, request.foto);
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

Future<dynamic> checkOutDetailPesananKomunitas(pesananID, produkID, qty) async {
  DetailPesanan detailPesanan = DetailPesanan(null, pesananID, produkID, qty);
  dynamic request = await createAlamat(detailPesanan);

  if (request is DetailPesanan) {
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
    // print("asdf");
    return produkKomunitass;
  } catch (e) {
    print('Error fetching produk komunitas: $e');
    return [];
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

Future<dynamic> createKeranjang(
    userID, List<DetailKeranjang> detailKeranjang) async {
  Keranjang keranjang = Keranjang(null, userID);

  List<DetailKeranjang> detailKeranjangList = detailKeranjang
      .map((detail) => DetailKeranjang(
          null, detail.keranjangID, detail.produkID, detail.qty))
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

void updateQtyDetail(int id) async {
  try {
    updateQtyDetail(id);
    print('Product quantity updated successfully');
  } catch (e) {
    print('Error updating product quantity: $e');
  }
}

void updateProductCart(int id) async {
  try {
    updateProductCart(id);
    print('Product updated successfully');
  } catch (e) {
    print('Error updating product : $e');
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

Future<List<RiwayatTukarSampah>> fetchRiwayatTukarSampah() async {
  try {
    List<RiwayatTukarSampah> riwayatTukarSampah = await fetchRiwayatTukarSampahFromAPI();
    print("Success");
    print(riwayatTukarSampah[0].berat);
    return riwayatTukarSampah;
  } catch (e) {
    print('Error fetching riwayat tukar samapah: $e');
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
    currentUser = User(request.id, request.name, request.tglLahir, request.telp,
    request.email, request.password, request.poin, request.role, request.foto);
    print("Profile Updated Successfully!");
    return request;
  } else {
    print("Failed To Edit Profil!");
    return null;
  }
}