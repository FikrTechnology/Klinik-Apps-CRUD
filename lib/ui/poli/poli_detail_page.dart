part of '../pages.dart';


class PoliDetailPage extends StatefulWidget {
  final Poli poli;
  const PoliDetailPage({
    super.key,
    required this.poli
  });

  @override
  State<PoliDetailPage> createState() => _PoliDetailPageState();
}

class _PoliDetailPageState extends State<PoliDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Poli"
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Ubah", style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Hapus", style: TextStyle(color: Colors.white),)
              ),
            ],
          )
        ],
      ),
    );
  }
}