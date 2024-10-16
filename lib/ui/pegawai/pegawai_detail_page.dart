part of '../pages.dart';

class PegawaiDetailPage extends StatefulWidget {
  final Pegawai data;
  const PegawaiDetailPage({super.key, required this.data});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pegawai"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "NIP : ${widget.data.nip}",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "Nama : ${widget.data.nama}",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "Tanggal Lahir : ${widget.data.tanggalLahir}",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "Nomor Telepon : ${widget.data.nomorTelepon}",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "Password : ${widget.data.password}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Ubah", style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hapus", style: TextStyle(color: Colors.white),)),
            ],
          )
        ],
      ),
    );
  }
}
