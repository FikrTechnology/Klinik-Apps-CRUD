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

  Future<Pegawai> getData() async {
    Pegawai data =
        await PegawaiService().getById(widget.dataPegawai.id.toString());
    setState(() {
      _nipController.text = data.nip;
      _namaPegawaiController.text = data.nama;
      _tglLahirPegawaiController.text = data.tanggalLahir;
      _nomorTlpPegawaiController.text = data.nomorTelepon;
      _usernameController.text = data.username;
      _passwordController.text = data.password;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                  onPressed: () async {
                    Pegawai data = Pegawai(
                        id: widget.dataPegawai.id,
                        nip: _nipController.text,
                        nama: _namaPegawaiController.text,
                        tanggalLahir: _tglLahirPegawaiController.text,
                        nomorTelepon: _nomorTlpPegawaiController.text,
                        username: _usernameController.text,
                        password: _passwordController.text);
                    String id = widget.dataPegawai.id.toString();
                    await PegawaiService().ubah(data, id).then((value) {
                      Navigator.pop(context);
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
