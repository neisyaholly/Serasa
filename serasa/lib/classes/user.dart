class User {
  String? name;
  DateTime? tglLahir;
  String? telp;
  String? email;
  String? password;

  User(
    this.name,
    this.email,
    this.password,
  );

  //buat ngubah objek user di atas jadi string json
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };

  //buat ubah data berparameter json jadi objek user
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["name"],
      json["email"],
      json["password"],
    );
  }
}
