part of 'forms.dart';

class PasienFormUpdate extends StatefulWidget {
  final Pasien dataPasien;
  const PasienFormUpdate({super.key, required this.dataPasien});

  @override
  State<PasienFormUpdate> createState() => _PasienFormUpdateState();
}

class _PasienFormUpdateState extends State<PasienFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRMController = TextEditingController();
  final _namapasienController = TextEditingController();
  final _tglLahirPasienController = TextEditingController();
  final _nomorTlpPasienController = TextEditingController();
  final _alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomorRMController.text = widget.dataPasien.nomorRm;
    _namapasienController.text = widget.dataPasien.nama;
    _tglLahirPasienController.text = widget.dataPasien.tanggalLahir;
    _nomorTlpPasienController.text = widget.dataPasien.nomorTelepon;
    _alamatController.text = widget.dataPasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data Pasien'),
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
                  onPressed: () {
                    Pasien data = Pasien(
                        nomorRm: _nomorRMController.text,
                        nama: _namapasienController.text,
                        tanggalLahir: _tglLahirPasienController.text,
                        nomorTelepon: _nomorTlpPasienController.text,
                        alamat: _alamatController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasienDetailPage(data: data),
                      ),
                    );
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
