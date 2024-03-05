class Pesanan {
  int? id;
  int? userID;
  int? sellerID;
  int? pembayaranID;
  int? jenis;
  int? selesai;
  DateTime? createdAt;

  Pesanan(
    this.id,
    this.userID,
    this.sellerID,
    this.pembayaranID,
    this.jenis,
    this.selesai,
    this.createdAt,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "sellerID": sellerID,
        "pembayaranID": pembayaranID,
        "jenis": jenis,
        "selesai": selesai,
        "createdAt": createdAt,
      };

  factory Pesanan.fromJson(Map<String, dynamic> json) {
    return Pesanan(
      json['id'],
      json["userID"],
      json["sellerID"],
      json["pembayaranID"],
      json["jenis"],
      json["selesai"],
      json["createdAt"],
    );
  }
}
