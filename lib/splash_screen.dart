import 'package:flutter/material.dart';

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
          Padding(padding: EdgeInsets.only(bottom:size.height * 0.125),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: (){},
              child: const Text('Iniciar sesión'),
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
                    child: const Text('Registrate')
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
