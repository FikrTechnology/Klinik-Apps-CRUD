part of '../pages.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  Stream<List<Pasien>> getList() async* {
    List<Pasien> data = await PasienService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Data Pasien'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasienForm(),
                ),
              );
            },
          )
        ],
      ),
      body: StreamBuilder<Object>(
          stream: getList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return const Center(child: Text("Tidak Ada Data"));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => PasienItem(
                  pasien: Pasien(
                      nomorRm: snapshot.data[index].nomorRm,
                      nama: snapshot.data[index].nama,
                      tanggalLahir: snapshot.data[index].tanggalLahir,
                      nomorTelepon: snapshot.data[index].nomorTelepon,
                      alamat: snapshot.data[index].alamat),
                ),
              ),
            );
          }),
    );
  }
}
