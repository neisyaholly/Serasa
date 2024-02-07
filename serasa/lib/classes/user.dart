class User {
  String? name;
  String? tglLahir;
  String? telp;
  String? email;
  String? password;

  User(
    this.name,
    this.tglLahir,
    this.telp,
    this.email,
    this.password,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "name": name,
        "tglLahir": tglLahir,
        "telp": telp,
        "email": email,
        "password": password,
      };

  //buat ubah data berparameter json jadi objek user
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["name"],
      json["tglLahir"],
      json["telp"],
      json["email"],
      json["password"],
    );
  }
}
