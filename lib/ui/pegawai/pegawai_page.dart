part of '../pages.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            PegawaiItem(
              pegawai: Pegawai(
                  nip: '17220207',
                  nama: 'Muhammad Fikrie',
                  tanggalLahir: '12-12-1234',
                  nomorTelepon: '081234567890',
                  password: 'testAja'),
            ),
            PegawaiItem(
              pegawai: Pegawai(
                  nip: '17220201',
                  nama: 'panjul',
                  tanggalLahir: '12-12-1235',
                  nomorTelepon: '081234567891',
                  password: 'testsini'),
            ),
            PegawaiItem(
              pegawai: Pegawai(
                  nip: '17220202',
                  nama: 'Ijul',
                  tanggalLahir: '12-12-1236',
                  nomorTelepon: '081234567892',
                  password: 'testMulu'),
            ),
            PegawaiItem(
              pegawai: Pegawai(
                  nip: '17220203',
                  nama: 'bre',
                  tanggalLahir: '12-12-1232',
                  nomorTelepon: '081234567899',
                  password: 'okeeeh'),
            ),
          ],
        ),
      ),
    );
  }
}
