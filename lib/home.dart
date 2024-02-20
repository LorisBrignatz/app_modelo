import 'package:flutter/material.dart';
import 'package:app/constantes.dart' as con;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List titleProducts = [];
  List<String> products = [];

  @override
  void initState(){
    titleProducts.add('Todos');
    titleProducts.add('Combos');
    titleProducts.add('Clasicos');
    titleProducts.add('Addcionales');

    products.add('id#nombre#imagen.png#calif#favoritos#categoria');
    products.add('id#nombre#imagen.png#calif#favoritos#categoria');
    products.add('id#nombre#imagen.png#calif#favoritos#categoria');
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
      drawer: DrawerWidget(),
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
                      color: con.amarillo,
                      fontSize: 24,
                      letterSpacing: 1.5
                    ),
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
                  itemBuilder: (BuildContext context, int index){
                    return Text(titleProducts[index], style: TextStyle(color: con.blanco, fontSize: 10),);
                  },
                ),
              ),
              listHomeProduct(size: size)
            ],
          )
        ],
      ),
    );
  }
}

class listHomeProduct extends StatelessWidget {
  const listHomeProduct({
    Key? key,
    required this.size,
  }) : super(key: key);

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
        itemCount: products.length / 2,
        itemBuilder: (BuildContext context, int index){
          int j = 0 + 2 = 2;
          int i = 1 + 2 = 3;
          var datos = products[j].split('#');
          var datos2 = products[i].split('#');
          datos[1];
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
                        'Hamburguesa',
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
                          Icon(Icons.star, color: Colors.yellowAccent, size: 14,),
                          Icon(Icons.heart_broken_outlined, size: 14,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              datos.isNotEmpty ? Expanded(
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
                        'Hamburguesa',
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
                          Icon(Icons.star, color: Colors.yellowAccent, size: 14,),
                          Icon(Icons.heart_broken_outlined, size: 14,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),);
        }
      ),
    ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

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
