class RiwayatTukarSampah {
  int? userID;
  int? berat;

  RiwayatTukarSampah(
    this.userID,
    this.berat,
  );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "berat": berat,
  };

  factory RiwayatTukarSampah.fromJson(Map<String, dynamic> json) {
    return RiwayatTukarSampah(
      json['userID'],
      json["berat"],
    );
  }
}