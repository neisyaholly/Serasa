class Pesanan {
  int? id;
  int? userID;
  int? sellerID;
  int? pembayaranID;
  int? ongkir;
  int? jenis;
  int? selesai;

  Pesanan(
    this.id,
    this.userID,
    this.sellerID,
    this.pembayaranID,
    this.ongkir,
    this.jenis,
    this.selesai,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "sellerID": sellerID,
        "pembayaranID": pembayaranID,
        "ongkir": ongkir,
        "jenis": jenis,
        "selesai": selesai,
      };

  factory Pesanan.fromJson(Map<String, dynamic> json) {
    return Pesanan(
      json['id'],
      json["userID"],
      json["sellerID"],
      json["pembayaranID"],
      json["ongkir"],
      json["jenis"],
      json["selesai"],
    );
  }
}
