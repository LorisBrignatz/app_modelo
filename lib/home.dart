import 'package:flutter/material.dart';
import 'package:app/constantes.dart' as con;
import 'package:app/drawer.dart';
import 'package:app/utils/singleton.dart';
import 'package:app/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();

  Singleton singleton = Singleton();

  @override
  void initState(){
    singleton.titleProducts.add('Todos');

    singleton.iniciarLista();

    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo,
      appBar: AppBar(
        backgroundColor: con.fondo,
        title: Center(
          child: Image.asset("imagenes/Welcome 2.png",
            width: size.width * 0.1,),
        ),
        iconTheme: IconThemeData(color: con.blanco),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {

              });
            },
            icon: Icon(Icons.local_grocery_store),
          ),
        ],
      ),
      //endDrawer:
      drawer: drawerWidget(singleton: singleton),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Qué hay de cenar?',
                    style: TextStyle(
                        color: con.amarillo,
                        fontSize: 28,
                        letterSpacing: 1.5
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    itemCount: singleton.titleProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(singleton.titleProducts[index], style: TextStyle(color: con.blanco, fontSize: 18),);
                    }
                ),
              ),
              Expanded(
                  child: listHomeProduct(size: size)
              )
            ],
          )
        ],
      ),
    );
  }
}

class listHomeProduct extends StatelessWidget {
  const listHomeProduct({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: con.naranja,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: size.height * 0.65,
          width: size.width,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: int.parse((singleton.products.length / 2).toString()),
              itemBuilder: (BuildContext context, int index) {

                if (index != 0) {
                  singleton.num1 = singleton.num1 + 2;
                  singleton.num2 = singleton.num2 + 2;
                }

                var datos1 = singleton.products[singleton.num1].split('#');
                var datos2 = singleton.products[singleton.num2].split('#');

                return Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: con.blanco,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("imagenes/Welcome 2.png",
                                width: size.width * 0.15,),
                              Text(
                                datos1[1],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                datos1[2],
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.star, color: Colors.yellowAccent, size: 14,),
                                  Icon(Icons.heart_broken_outlined, size: 14,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ), // 50%
                      SizedBox(width: 15,),
                      datos2.isNotEmpty ? Expanded(
                        flex: 6,
                        child: InkWell(
                          onTap: () {
                            print('${datos2[1]}');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(datos2[1]),
                                  content: Text(datos2[2]),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Confirm'),
                                      onPressed: () {
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: con.blanco,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("imagenes/Welcome 2.png",
                                  width: size.width * 0.15,),
                                Text(datos2[1], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                Text(datos2[2], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.star, color: Colors.yellowAccent, size: 14,),
                                    Icon(Icons.heart_broken_outlined, size: 14,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ) : Container() // 50%
                    ],
                  ),
                );
              }
          ),
        )

    );
  }
}