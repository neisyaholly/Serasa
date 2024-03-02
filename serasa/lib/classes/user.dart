class User {
  int? id;
  String? name;
  String? tglLahir;
  String? telp;
  String? email;
  String? password;

  User(
    this.id,
    this.name,
    this.tglLahir,
    this.telp,
    this.email,
    this.password,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tglLahir": tglLahir,
        "telp": telp,
        "email": email,
        "password": password,
      };

  //buat ubah data berparameter json jadi objek user
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json["name"],
      json["tglLahir"],
      json["telp"],
      json["email"],
      json["password"],
    );
  }
}
