class VoucherUser {
  int? id;
  int? voucherID;
  int? userID;
  int? terpakai;

  VoucherUser(
    this.id,
    this.voucherID,
    this.userID,
    this.terpakai,
  );

  //buat ngubah objek voucher di atas jadi string json
  Map<String, dynamic> toJson() => {
        "id": id,
        "voucherID": voucherID,
        "userID": userID,
        "terpakai": terpakai,
  };

  //buat ubah data berparameter json jadi objek voucher
  factory VoucherUser.fromJson(Map<String, dynamic> json) {
    return VoucherUser(
      json['id'],
      json["voucherID"],
      json["userID"],
      json["terpakai"],
    );
  }
}
