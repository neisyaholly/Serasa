class BankSampah {
  int? id;
  String? nama;
  String? lokasi;
  
  BankSampah(
    this.id,
    this.nama,
    this.lokasi,
  );

  //buat ngubah objek voucher di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "lokasi": lokasi,
  };

  //buat ubah data berparameter json jadi objek voucher
  factory BankSampah.fromJson(Map<String, dynamic> json) {
    return BankSampah(
      json['id'],
      json['nama'],
      json["lokasi"],
    );
  }
}
