part of '../pages.dart';

class PegawaiDetailPage extends StatefulWidget {
  final Pegawai data;
  const PegawaiDetailPage({super.key, required this.data});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  Stream<Pegawai> getData() async* {
    Pegawai data = await PegawaiService().getById(widget.data.id.toString());
    yield data;
  }

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
      body: StreamBuilder<Object>(
          stream: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) Text(snapshot.error.toString());
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return const Center(child: Text('Tidak ada data'));
            }
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "NIP : ${snapshot.data.nip}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Nama : ${snapshot.data.nama}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Tanggal Lahir : ${snapshot.data.tanggalLahir}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Nomor Telepon : ${snapshot.data.nomorTelepon}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Username : ${snapshot.data.username}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Password : ${snapshot.data.password}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StreamBuilder<Object>(
                        stream: getData(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return BtnUpdate(
                            text: "Ubah",
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PegawaiFormUpdate(
                                    dataPegawai: snapshot.data,
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                    BtnDelete(
                      buttonText: "Hapus",
                      backgroundColor: Colors.red,
                      onConfirm: () async {
                        await PegawaiService()
                            .hapus(snapshot.data)
                            .then((value) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PegawaiPage(),
                            ),
                          );
                        });
                      },
                    )
                  ],
                )
              ],
            );
          }),
    );
  }
}
