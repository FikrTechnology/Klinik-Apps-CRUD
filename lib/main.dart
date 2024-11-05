part of 'ui/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik Kite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const LoginPage(),
      //   '/beranda': (context) => const BerandaPage(),
      //   '/poliPage': (context) => const PoliPage(),
      //   '/pegawaiPage': (context) => const PegawaiPage(),
      //   '/pasienPage': (context) => const PasienPage(),
      // },
    );
  }
}
