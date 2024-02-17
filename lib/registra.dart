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
          // Background image with transparency
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("imagenes/Welcome 1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.4), // Adjust transparency here
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // Align the column content at the bottom
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo centré en haut
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: Image.asset(
                      'imagenes/Welcome 2.png',
                      width: 100, // Ajoutez la largeur désirée pour votre logo
                      height: 100, // Ajoutez la hauteur désirée pour votre logo
                    ),
                  ),
                  // Box blanche avec le texte 'Bienvenido al registro'
                  Container(
                    padding: EdgeInsets.all(20),
                    // Ajustez le padding
                    margin: EdgeInsets.only(bottom: 20),
                    // Move the white box to the bottom
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
                        // Champs de saisie entourés par un rectangle avec des bordures grises
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
                        // Bouton 'Registrarse'
                        ElevatedButton(
                          onPressed: () {
                            if (nombreCompletoController.text.isNotEmpty &&
                                correoController.text.isNotEmpty &&
                                direccionController.text.isNotEmpty &&
                                contrasenaController.text.isNotEmpty) {
                              // Tous les champs sont remplis, naviguer vers la page Home
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            } else {
                              // Afficher un message indiquant que tous les champs doivent être remplis
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
                                horizontal: 40), // Ajustement du padding horizontal
                          ),
                        ),
                        SizedBox(height: 10),
                        // Texte 'Políticas de Privacidad'
                        TextButton(
                          onPressed: () {
                            // Ajouter votre logique pour les politiques de confidentialité
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
                        // Afficher un message si tous les champs ne sont pas remplis
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
          // Carré pour la photo de profil
          Positioned(
            bottom: 450,
            // Ajustez la position verticale du carré
            left: size.width * 0.5 - 50,
            // Ajustez la position horizontale pour centrer le carré
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // Bords arrondis
                border: Border.all(color: Colors.red, width: 2),
                // Bordure rouge
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    // Couleur rouge avec opacité
                    spreadRadius: 5,
                    // Rayon de diffusion de l'ombre
                    blurRadius: 7,
                    // Flou de l'ombre
                    offset: Offset(0, 3), // Décalage de l'ombre
                  ),
                ],
                color: Colors.grey[300], // Gris clair
              ),
              child: Icon(
                Icons.add, // Utilisez l'icône d'ajout
                size: 50, // Taille de l'icône
                color: Colors.grey[600], // Couleur de l'icône
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
        // Définissez obscureText sur true pour le champ de mot de passe
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          // Ajuster la taille du champ de saisie
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
          // Ajuster la taille de la police du libellé
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
// Méthode pour construire les champs de saisie
  /*Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10), // Ajuster la taille du champ de saisie
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12), // Ajuster la taille de la police du libellé
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}*/
