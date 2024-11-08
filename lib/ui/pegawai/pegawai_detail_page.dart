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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PegawaiPage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
            "Username : ${widget.data.username}",
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
              BtnUpdate(
                text: "Ubah",
                backgroundColor: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  Pegawai data = Pegawai(
                      nip: widget.data.nip,
                      nama: widget.data.nama,
                      tanggalLahir: widget.data.tanggalLahir,
                      nomorTelepon: widget.data.nomorTelepon,
                      username: widget.data.username,
                      password: widget.data.password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PegawaiFormUpdate(
                        dataPegawai: data,
                      ),
                    ),
                  );
                },
              ),
              BtnDelete(
                buttonText: "Hapus",
                backgroundColor: Colors.red,
                onConfirm: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PegawaiPage(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
