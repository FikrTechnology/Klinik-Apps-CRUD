part of 'widgets.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  const PasienItem({
    super.key,
    required this.pasien,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetailPage(data: pasien)));
      },
      child: Card(
        child: ListTile(
          title: Text(pasien.nama),
        ),
      ),
    );
  }
}
