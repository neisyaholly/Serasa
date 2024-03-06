class Pembayaran {
  int? id;
  String? jenis;

  Pembayaran(
    this.id,
    this.jenis,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": jenis,
      };

  factory Pembayaran.fromJson(Map<String, dynamic> json) {
    return Pembayaran(
      json['id'],
      json["jenis"],
    );
  }
}
