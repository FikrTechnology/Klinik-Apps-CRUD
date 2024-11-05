part of 'pages.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: const Center(
        child: Text('Selamat Datang'),
      ),
    );
  }
}