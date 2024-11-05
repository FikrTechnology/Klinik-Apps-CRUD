part of '../pages.dart';

class PoliDetailPage extends StatefulWidget {
  final Poli poli;
  const PoliDetailPage({super.key, required this.poli});

  @override
  State<PoliDetailPage> createState() => _PoliDetailPageState();
}

class _PoliDetailPageState extends State<PoliDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Poli"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
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
                  Poli data = Poli(namaPoli: widget.poli.namaPoli);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoliFormUpdate(data: data),
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
                      builder: (context) => const PoliPage(),
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
