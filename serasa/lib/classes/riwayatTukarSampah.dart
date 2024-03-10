class RiwayatTukarSampah {
  int? userID;
  int? berat;
  String? created_at;

  RiwayatTukarSampah(
    this.userID,
    this.berat,
    this.created_at,
  );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "berat": berat,
        "created_at": created_at,
  };

  factory RiwayatTukarSampah.fromJson(Map<String, dynamic> json) {
    return RiwayatTukarSampah(
      json['userID'],
      json["berat"],
      json["created_at"],
    );
  }
}