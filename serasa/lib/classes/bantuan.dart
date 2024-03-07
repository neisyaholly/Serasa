class Bantuan {
  int? id;
  int? userID;
  String? isi;

  Bantuan(
    this.id,
    this.userID,
    this.isi,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "isi" : isi,
      };

  factory Bantuan.fromJson(Map<String, dynamic> json) {
    return Bantuan(
      json['id'],
      json["userID"],
      json["isi"],
    );
  }
}
