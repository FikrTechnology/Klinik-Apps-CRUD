part of '../pages.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien data;
  const PasienDetailPage({super.key, required this.data});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pasien"),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasienPage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Nomor RM : ${widget.data.nomorRm}",
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
            "Alamat : ${widget.data.alamat}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Pasien data = Pasien(
                      nomorRm: widget.data.nomorRm,
                      nama: widget.data.nama,
                      tanggalLahir: widget.data.tanggalLahir,
                      nomorTelepon: widget.data.nomorTelepon,
                      alamat: widget.data.alamat);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasienFormUpdate(
                        dataPasien: data,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Ubah",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Hapus",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
