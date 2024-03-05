class DetailPesanan {
  int? id;
  int? pesananID;
  int? produkID;
  int? qty;

  DetailPesanan(
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

  factory DetailPesanan.fromJson(Map<String, dynamic> json) {
    return DetailPesanan(
      json['id'],
      json["pesananID"],
      json["produkID"],
      json["qty"],
    );
  }
}
