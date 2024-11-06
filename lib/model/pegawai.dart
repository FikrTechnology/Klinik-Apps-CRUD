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
}
