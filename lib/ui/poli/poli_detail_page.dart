part of '../pages.dart';

class PoliDetailPage extends StatefulWidget {
  final Poli poli;
  const PoliDetailPage({super.key, required this.poli});

  @override
  State<PoliDetailPage> createState() => _PoliDetailPageState();
}

class _PoliDetailPageState extends State<PoliDetailPage> {
  Stream<Poli> getData() async* {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Poli"),
        automaticallyImplyLeading: false,
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
                  "Nama Poli : ${snapshot.data.namaPoli}",
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
                                  builder: (context) =>
                                      PoliFormUpdate(data: snapshot.data),
                                ),
                              );
                            },
                          );
                        }),
                    BtnDelete(
                      buttonText: "Hapus",
                      backgroundColor: Colors.red,
                      onConfirm: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PoliPage(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
