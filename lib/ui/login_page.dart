part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login Admin',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Column(
                      children: [
                        _usernameTextField(),
                        const SizedBox(
                          height: 20,
                        ),
                        _passwordTextField(),
                        const SizedBox(
                          height: 40,
                        ),
                        _tombolLogin(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Username',
      ),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () async {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            // await LoginService().login(username, password).then((isLogin) {
            //   if (isLogin) {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const BerandaPage(),
            //       ),
            //     );
            //   } else {
            //     AlertDialog alertDialog = AlertDialog(
            //       content: const Text('Username atau Password tidak valid'),
            //       actions: [
            //         ElevatedButton(
            //           onPressed: () {
            //             Navigator.pop(context);
            //           },
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.green),
            //           child: const Text('OK'),
            //         )
            //       ],
            //     );
            //     showDialog(context: context, builder: (context) => alertDialog);
            //   }
            // });

            if (username == 'admin' && password == 'admin') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BerandaPage(),
                ),
              );
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text('Username atau Password tidak valid'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                    Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    child: const Text('OK'),
                  )
                ],
              );
              showDialog(context: context, builder: (context) => alertDialog);
            }
          },
          child: const Text('Login')),
    );
  }
}
