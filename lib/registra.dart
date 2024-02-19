import 'package:flutter/material.dart';
import 'package:app/home.dart';
import 'package:app/constantes.dart' as con;

class Registra extends StatefulWidget {
  const Registra({Key? key}) : super(key: key);

  @override
  State<Registra> createState() => _RegistraState();
}

class _RegistraState extends State<Registra> {
  final nombreCompletoController = TextEditingController();
  final correoController = TextEditingController();
  final direccionController = TextEditingController();
  final contrasenaController = TextEditingController();

  bool allFieldsFilled = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

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
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: Image.asset(
                      'imagenes/Welcome 2.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Bienvenido al registro',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight
                              .bold, color: con.amarillo),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            buildTextField('Nombre', nombreCompletoController),
                            SizedBox(height: 10),
                            buildTextField('Correo', correoController),
                            SizedBox(height: 10),
                            buildTextField('Dirección de envío',
                                direccionController),
                            SizedBox(height: 10),
                            buildTextField('Contraseña', contrasenaController,
                                obscureText: true),
                          ],
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                            if (nombreCompletoController.text.isNotEmpty &&
                                correoController.text.isNotEmpty &&
                                direccionController.text.isNotEmpty &&
                                contrasenaController.text.isNotEmpty) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            } else {
                              setState(() {
                                allFieldsFilled = true;
                              });
                            }
                          },
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(color: con.blanco, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: con.naranja,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20,
                                horizontal: 40),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            print('Políticas de Privacidad');
                          },
                          child: Text(
                            'Políticas de Privacidad',
                            style: TextStyle(
                              color: con.amarillo,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        allFieldsFilled
                            ? Text(
                          'Todos los campos deben ser completados',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 450,
            left: size.width * 0.5 - 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.add,
                size: 50,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
