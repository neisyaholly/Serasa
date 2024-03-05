class Pesanan {
  int? id;
  int? userID;
  int? sellerID;
  int? pembayaranID;
  int? jenis;
  int? selesai;

  Pesanan(
    this.id,
    this.userID,
    this.sellerID,
    this.pembayaranID,
    this.jenis,
    this.selesai,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "sellerID": sellerID,
        "pembayaranID": pembayaranID,
        "jenis": jenis,
        "selesai": selesai,
      };

  factory Pesanan.fromJson(Map<String, dynamic> json) {
    return Pesanan(
      json['id'],
      json["userID"],
      json["sellerID"],
      json["pembayaranID"],
      json["jenis"],
      json["selesai"],
    );
  }
}
