part of 'forms.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _namaPegawaiController = TextEditingController();
  final _tglLahirPegawaiController = TextEditingController();
  final _nomorTlpPegawaiController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
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
                  onPressed: () async {
                    Pegawai data = Pegawai(
                        nip: _nipController.text,
                        nama: _namaPegawaiController.text,
                        tanggalLahir: _tglLahirPegawaiController.text,
                        nomorTelepon: _nomorTlpPegawaiController.text,
                        username: _usernameController.text,
                        password: _passwordController.text);
                    await PegawaiService().simpan(data).then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PegawaiDetailPage(data: data),
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
