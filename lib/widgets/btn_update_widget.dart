part of 'widgets.dart';

class BtnUpdate extends StatelessWidget {
  const BtnUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text(
        "Ubah",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
