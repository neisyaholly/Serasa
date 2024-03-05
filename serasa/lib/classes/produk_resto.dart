class ProdukResto {
  int? id;
  String? nama;
  String? deskripsi;
  int? harga;
  int? qty;
  String? foto;

  ProdukResto(
    this.id,
    this.nama,
    this.deskripsi,
    this.harga,
    this.qty,
    this.foto,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "harga": harga,
        "qty": qty,
        "foto": foto,
      };

  //buat ubah data berparameter json jadi objek user
  factory ProdukResto.fromJson(Map<String, dynamic> json) {
    return ProdukResto(
      json['id'],
      json["nama"],
      json["deskripsi"],
      json["harga"],
      json["qty"],
      json["foto"],
    );
  }
}
