import 'package:flutter/material.dart';
import 'package:app/constantes.dart' as con;
import 'package:app/utils/singleton.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();

  Singleton singleton = Singleton();
  List<String> titleProducts = [];
  List<String> products = [];

  @override
  void initState() {
    super.initState();
    singleton.titleProducts.add('Todos');

    singleton.iniciarLista();
    titleProducts.add('Combos');
    titleProducts.add('Clasicos');
    titleProducts.add('Adicionales');

    products.add('id#nombre#imagen.png#calif#favoritos#categoria');
    products.add('id#nombre#imagen.png#calif#favoritos#categoria');
    products.add('id#nombre#imagen.png#calif#favoritos#categoria');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo,
      appBar: AppBar(
        backgroundColor: con.fondo,
        title: Center(
          child: Image.asset(
            "imagenes/Welcome 2.png",
            width: size.width * 0.1,
          ),
        ),
        iconTheme: IconThemeData(color: con.blanco),
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
      drawer: DrawerWidget(singleton: singleton),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Qué hay de cenar ?',
                    style: TextStyle(
                        color: con.amarillo, fontSize: 24, letterSpacing: 1.5),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemCount: titleProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      titleProducts[index],
                      style: TextStyle(color: con.blanco, fontSize: 10),
                    );
                  },
                ),
              ),
              ListHomeProduct(
                size: size,
                products: products,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ListHomeProduct extends StatelessWidget {
  const ListHomeProduct({
    Key? key,
    required this.size,
    required this.products,
  }) : super(key: key);

  final Size size;
  final List<String> products;

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
          itemCount: int.parse((singleton.products.length/2).toString()),
          itemBuilder: (BuildContext context, int index) {

            if (index != 0){
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
                          Image.asset(
                            "imagenes/Welcome 2.png",
                            width: size.width * 0.15,
                          ),
                          Text(
                            datos1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Nuevo estilo',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.star,
                                  color: Colors.yellowAccent, size: 14),
                              Icon(Icons.favorite_border, size: 14),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final Singleton singleton;

  const DrawerWidget({Key? key, required this.singleton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                "Abhishek Mishra",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text(' My Course '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text(' Go Premium '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_label),
            title: Text(' Saved Videos '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

