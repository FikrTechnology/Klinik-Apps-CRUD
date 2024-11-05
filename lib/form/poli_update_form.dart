part of 'forms.dart';

class PoliFormUpdate extends StatefulWidget {
  final Poli data;
  const PoliFormUpdate({super.key, required this.data});

  @override
  State<PoliFormUpdate> createState() => _PoliFormUpdateState();
}

class _PoliFormUpdateState extends State<PoliFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoli = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaPoli.text = widget.data.namaPoli;
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
                  controller: _namaPoli,
                  decoration: const InputDecoration(
                    labelText: 'Nomor RM',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Poli data = Poli(namaPoli: _namaPoli.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoliDetailPage(poli: data),
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
