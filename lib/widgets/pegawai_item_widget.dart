part of 'widgets.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  const PegawaiItem({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetailPage(data: pegawai)));
      },
      child: Card(
        child: ListTile(
          title: Text(pegawai.nama),
        ),
      ),
    );
  }
}
