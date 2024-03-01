import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/constantes.dart' as con;
import 'package:app/utils/singleton.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final password = TextEditingController();
  bool bandera = false;

  late final SharedPreferences prefs;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    checkIsLogin();
  }

  void checkIsLogin(){
    //String pass = (prefs.getString('pass') ?? '');
    //String user = (prefs.getString('user') ?? '');
    bool band = (prefs.getBool('isLogeado') ?? false);

    if(band) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.45),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imagenes/Welcome 1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.55),
            child: Container(
              color: con.fondo,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'imagenes/Welcome 2.png',
              width: size.width * 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                bottom: size.height * 0.08
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: con.blanco,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Bienvenido a Burger Classic',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: user,
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Correo/Usuario',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: con.naranja,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            fixedSize:
                            Size(size.width * 0.6, size.height * 0.05),
                          ),
                          onPressed: () {
                            if (user.text == 'loris' && password.text == '1234') {
                              singleton.user = user.text;
                              singleton.password = password.text;
                              prefs.setString('user', user.text);
                              prefs.setString('pass', password.text);
                              prefs.setBool('isLogeado', true);

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder:
                                      (context) => const Home()));
                            } else {
                              setState(() {
                                bandera = true;
                              });
                            }
                          },
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Olvidaste tu contraseña?',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                        const SizedBox(height: 20),
                        bandera
                            ? Text(
                          'USUARIO O CONTRASENA INCORRECTOS',
                          style: TextStyle(color: con.blanco, fontSize: 20, backgroundColor: con.fondo),
                        )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}