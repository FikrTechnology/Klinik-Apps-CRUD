part of '../pages.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien data;
  const PasienDetailPage({super.key, required this.data});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  Stream<Pasien> getData() async* {
    Pasien data = await PasienService().getById(widget.data.id.toString());
    yield data;
  }

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
                  "Nomor RM : ${snapshot.data.nomorRm}",
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
                  "Alamat : ${snapshot.data.alamat}",
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
                                  builder: (context) => PasienFormUpdate(
                                    dataPasien: snapshot.data,
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
                        await PasienService().hapus(widget.data).then((value) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PasienPage(),
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
