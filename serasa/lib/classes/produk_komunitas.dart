class ProdukKomunitas {
  int? id;
  int? userID;
  String? nama;
  String? deskripsi;
  int? harga;
  String? exp;
  String? foto;
  String? name;
  String? kab_kota;

  ProdukKomunitas(
    this.id,
    this.userID,
    this.nama,
    this.deskripsi,
    this.harga,
    this.exp,
    this.foto,
    this.name,
    this.kab_kota
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "nama": nama,
        "deskripsi": deskripsi,
        "harga": harga,
        "exp": exp,
        "foto": foto,
        "userName": name,
        "kab_kota": kab_kota,
      };

  //buat ubah data berparameter json jadi objek user
  factory ProdukKomunitas.fromJson(Map<String, dynamic> json) {
    return ProdukKomunitas(
      json['id'],
      json['userID'],
      json['nama'],
      json['deskripsi'],
      json['harga'] as int,
      json['exp'],
      json['foto'],
      json['name'],
      json['kab_kota']
    );
  }
}
