class Keranjang {
  int? id;
  int? userID;

  Keranjang(
    this.id,
    this.userID,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
      };

  factory Keranjang.fromJson(Map<String, dynamic> json) {
    return Keranjang(
      json['id'],
      json["userID"],
    );
  }
}
