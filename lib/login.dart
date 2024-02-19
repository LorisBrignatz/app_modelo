import 'package:flutter/material.dart';
import 'package:app/home.dart';
import 'package:app/constantes.dart' as con;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final pass = TextEditingController();

  bool bandera = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("imagenes/Welcome 1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'imagenes/Welcome 2.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Bienvenido a Burger Classic',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: con.amarillo),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Correo/Usuario",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: user,
                        obscureText: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Contraseña",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            print(user.text);
                            print(pass.text);
                            if(user.text == 'loris' && pass.text == '1234'){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            } else {
                              bandera = true;
                            }
                          });
                        },
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(color:con.blanco, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: con.naranja,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            fixedSize: Size(size.width * 0.6, 45)
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          print("Olvidaste tu contraseña ?");
                        },
                        child: Text(
                          'Olvidaste tu contraseña ?',
                          style: TextStyle(
                              color: con.amarillo,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1,
                              decorationColor: con.amarillo),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      bandera ? Text(
                        'Usuario o contraseña incorrectos',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ) : Container(),
                    ],
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
