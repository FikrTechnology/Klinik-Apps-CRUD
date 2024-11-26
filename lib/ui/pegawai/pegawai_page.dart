part of '../pages.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  Stream<List<Pegawai>> getList() async* {
    List<Pegawai> data = await PegawaiService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Data Pegawai'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PegawaiForm(),
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
              return const Center(child: Text('Tidak Ada Data'));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return PegawaiItem(
                      pegawai: Pegawai(
                          nip: snapshot.data[index].nip,
                          nama: snapshot.data[index].nama,
                          tanggalLahir: snapshot.data[index].tanggalLahir,
                          nomorTelepon: snapshot.data[index].nomorTelepon,
                          username: snapshot.data[index].username,
                          password: snapshot.data[index].password));
                },
              ),
            );
          }),
    );
  }
}
