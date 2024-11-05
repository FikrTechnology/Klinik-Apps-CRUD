part of '../pages.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            PasienItem(
              pasien: Pasien(
                nomorRm: '101',
                nama: 'Renaldo',
                tanggalLahir: '01-12-1234',
                nomorTelepon: '081234567890',
                alamat: 'disana',
              ),
            ),
            PasienItem(
              pasien: Pasien(
                nomorRm: '102',
                nama: 'Nico',
                tanggalLahir: '01-12-1235',
                nomorTelepon: '081234567891',
                alamat: 'disini',
              ),
            ),
            PasienItem(
              pasien: Pasien(
                nomorRm: '103',
                nama: 'Ardie',
                tanggalLahir: '01-12-1236',
                nomorTelepon: '081234567892',
                alamat: 'disitu',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
