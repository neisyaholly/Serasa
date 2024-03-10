class Voucher {
  int? id;
  int? restoID;
  String? nama;
  int? poin;
  String? deskripsi;
  String? sk;
  String? exp;
  String? foto;

  Voucher(
    this.id,
    this.restoID,
    this.nama,
    this.poin,
    this.deskripsi,
    this.sk,
    this.exp,
    this.foto,
  );

  //buat ngubah objek voucher di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "restoID": restoID,
        "nama": nama,
        "poin": poin,
        "deskripsi": deskripsi,
        "sk": sk,
        "exp": exp,
        "foto": foto,
      };

  //buat ubah data berparameter json jadi objek voucher
  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      json['id'],
      json["restoID"],
      json["nama"],
      json["poin"],
      json["deskripsi"],
      json["sk"],
      json["exp"],
      json["foto"],
    );
  }
}
