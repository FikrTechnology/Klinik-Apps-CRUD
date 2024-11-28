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

  Future<Poli> getData() async {
    Poli data = await PoliService().getById(widget.data.id.toString());
    setState(() {
      _namaPoli.text = data.namaPoli;
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
                    labelText: 'Nama Poli',
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Poli data =
                        Poli(id: widget.data.id, namaPoli: _namaPoli.text);
                    String id = widget.data.id.toString();
                    await PoliService().ubah(data, id).then((value) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PoliDetailPage(poli: data),
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
