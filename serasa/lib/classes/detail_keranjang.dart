class DetailKeranjang {
  int? id;
  int? keranjangID;
  int? produkID;
  int? qty;

  DetailKeranjang(
    this.id,
    this.keranjangID,
    this.produkID,
    this.qty,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "keranjangID": keranjangID,
        "produkID": produkID,
        "qty": qty,
      };

  factory DetailKeranjang.fromJson(Map<String, dynamic> json) {
    return DetailKeranjang(
      json['id'],
      json["keranjangID"],
      json["produkID"],
      json["qty"],
    );
  }
}
