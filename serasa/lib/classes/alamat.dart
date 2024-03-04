class Alamat {
  int? id;
  String? nama;
  String? jalan;
  String? kel;
  String? kec;
  String? kab_kota;
  String? provinsi;
  String? kode_pos;
  int? userID;
  int? utama;

  Alamat(
    this.id,
    this.nama,
    this.jalan,
    this.kel,
    this.kec,
    this.kab_kota,
    this.provinsi,
    this.kode_pos,
    this.userID,
    this.utama,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jalan": jalan,
        "kel": kel,
        "kec": kec,
        "kab_kota": kab_kota,
        "provinsi": provinsi,
        "kode_pos": kode_pos,
        "userID": userID,
        "utama": utama,
      };

  factory Alamat.fromJson(Map<String, dynamic> json) {
    return Alamat(
      json['id'],
      json["nama"],
      json["jalan"],
      json["kel"],
      json["kec"],
      json["kab_kota"],
      json["provinsi"],
      json["kode_pos"],
      json["userID"],
      json["utama"],
    );
  }
}
