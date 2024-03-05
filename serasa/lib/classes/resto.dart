class Resto {
  int? id;
  String? nama;
  String? cabang;
  String? lokasi;
  String? rating;
  String? kategori;
  String? logo;

  Resto(
    this.id,
    this.nama,
    this.cabang,
    this.lokasi,
    this.rating,
    this.kategori,
    this.logo,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "cabang": cabang,
        "lokasi": lokasi,
        "rating": rating,
        "kategori": kategori,
        "logo": logo,
      };

  //buat ubah data berparameter json jadi objek user
  factory Resto.fromJson(Map<String, dynamic> json) {
    return Resto(
      json['id'],
      json["nama"],
      json["cabang"],
      json["lokasi"],
      json["rating"],
      json["kategori"],
      json["logo"],
    );
  }
}
