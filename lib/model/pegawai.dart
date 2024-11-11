class Pegawai {
  String? id;
  String nip;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String username;
  String password;

  Pegawai(
      {this.id,
      required this.nip,
      required this.nama,
      required this.tanggalLahir,
      required this.nomorTelepon,
      required this.username,
      required this.password});

  factory Pegawai.fromJson(Map<String, dynamic> json) {
    return Pegawai(
      id: json['id'].toString(),
      nip: json['nip'].toString(),
      nama: json['nama'].toString(),
      tanggalLahir: json['tanggal_lahir'].toString(),
      nomorTelepon: json['nomor_telepon'].toString(),
      username: json['username'].toString(),
      password: json['password'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'nip': nip,
      'nama': nama,
      'tanggal_lahir': tanggalLahir,
      'nomor_telepon': nomorTelepon,
      'username': username,
      'password': password,
    };
  }
}
