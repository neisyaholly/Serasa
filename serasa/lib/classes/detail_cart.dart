class DetailCart {
  int? id;
  int? keranjangID;
  int? produkID;
  int? qty;

  DetailCart(
    this.id,
    this.keranjangID,
    this.produkID,
    this.qty,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "CartID": keranjangID,
        "produkID": produkID,
        "qty": qty,
      };

  factory DetailCart.fromJson(Map<String, dynamic> json) {
    return DetailCart(
      json['id'],
      json["keranjangID"],
      json["produkID"],
      json["qty"],
    );
  }
}
