part of 'forms.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRMController = TextEditingController();
  final _namapasienController = TextEditingController();
  final _tglLahirPasienController = TextEditingController();
  final _nomorTlpPasienController = TextEditingController();
  final _alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pasien'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextField(
                  controller: _nomorRMController,
                  decoration: const InputDecoration(
                    labelText: 'Nomor RM',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _namapasienController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                  ),
                ),
                TextField(
                  controller: _tglLahirPasienController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                TextField(
                  controller: _nomorTlpPasienController,
                  decoration: const InputDecoration(
                    labelText: 'Nomor Telepon',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _alamatController,
                  decoration: const InputDecoration(
                    labelText: 'ALamat',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Pasien data = Pasien(
                        nomorRm: _nomorRMController.text,
                        nama: _namapasienController.text,
                        tanggalLahir: _tglLahirPasienController.text,
                        nomorTelepon: _nomorTlpPasienController.text,
                        alamat: _alamatController.text);
                    await PasienService().simpan(data).then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasienDetailPage(data: value),
                        ),
                      );
                    });
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
