import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:app/constantes.dart' as con;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                fit: BoxFit.fill
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.1,
              left: size.width *0.1,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset("imagenes/Welcome 2.png",
                width: size.width * 0.2,)
            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom:size.height * 0.125),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder:
                        (context) => const Login()));
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom:size.height * 0.125),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: (){},
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
          ),
          ),
          Padding(padding: EdgeInsets.only(bottom:size.height * 0.045),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No tienes cuenta? '),
                TextButton(
                    onPressed: (){},
                    child: const Text('Registrate', style: TextStyle(color: con.naranja),
                    )
                )
              ],
            ),
          ),
          ),
        ]
      )
    );
  }
}
