part of 'forms.dart';

class PegawaiFormUpdate extends StatefulWidget {
  final Pegawai dataPegawai;
  const PegawaiFormUpdate({super.key, required this.dataPegawai});

  @override
  State<PegawaiFormUpdate> createState() => _PegawaiFormUpdateState();
}

class _PegawaiFormUpdateState extends State<PegawaiFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _namaPegawaiController = TextEditingController();
  final _tglLahirPegawaiController = TextEditingController();
  final _nomorTlpPegawaiController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nipController.text = widget.dataPegawai.nip;
    _namaPegawaiController.text = widget.dataPegawai.nama;
    _tglLahirPegawaiController.text = widget.dataPegawai.tanggalLahir;
    _nomorTlpPegawaiController.text = widget.dataPegawai.nomorTelepon;
    _usernameController.text = widget.dataPegawai.username;
    _passwordController.text = widget.dataPegawai.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data Pegawai'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextField(
                  controller: _nipController,
                  decoration: const InputDecoration(
                    labelText: 'NIP',
                  ),
                ),
                TextField(
                  controller: _namaPegawaiController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                  ),
                ),
                TextField(
                  controller: _tglLahirPegawaiController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                ),
                TextField(
                  controller: _nomorTlpPegawaiController,
                  decoration: const InputDecoration(
                    labelText: 'Nomor Telepon',
                  ),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Pegawai data = Pegawai(
                        nip: _nipController.text,
                        nama: _namaPegawaiController.text,
                        tanggalLahir: _tglLahirPegawaiController.text,
                        nomorTelepon: _nomorTlpPegawaiController.text,
                        username: _usernameController.text,
                        password: _passwordController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PegawaiDetailPage(data: data),
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
