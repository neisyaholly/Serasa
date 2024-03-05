class Alamat {
  int? id;
  int? pesananID;
  int? produkID;
  int? qty;

  Alamat(
    this.id,
    this.pesananID,
    this.produkID,
    this.qty,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "pesananID": pesananID,
        "produkID": produkID,
        "qty": qty,
      };

  factory Alamat.fromJson(Map<String, dynamic> json) {
    return Alamat(
      json['id'],
      json["pesananID"],
      json["produkID"],
      json["qty"],
    );
  }
}
