part of '../pages.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Data Poli'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PoliForm(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            PoliItem(poli: Poli(namaPoli: "Poli Anak")),
            PoliItem(poli: Poli(namaPoli: "Poli Kandungan")),
            PoliItem(poli: Poli(namaPoli: "Poli Gigi")),
            PoliItem(poli: Poli(namaPoli: "Poli THT")),
          ],
        ),
      ),
    );
  }
}
