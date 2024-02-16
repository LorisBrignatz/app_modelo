import 'package:flutter/material.dart';
import 'package:app/constantes.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo,
      appBar: AppBar(
        backgroundColor: con.fondo,
        //elevation: 10,
        //shadowColor: Colors.white,
        title: Center(
          child: Image.asset("imagenes/Welcome 2.png",
          width: size.width * 0.1,),
        ),
        iconTheme: IconTheme(color: con.blanco),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.local_grocery_store),
          ),
          InkWell(
            onTap: () {},
            child: Icon(Icons.local_grocery_store),
          ),
        ],
      ),
      endDrawer: ,
      drawer: drawerWidget(),
      body: Stack(
        children: [
        ],
      ),
    );
  }
}
