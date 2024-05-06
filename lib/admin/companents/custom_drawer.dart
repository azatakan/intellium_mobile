import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    // Drawer içeriğini daha sonra doldurabilirsiniz
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 31, 36, 49),
      child: ListView(
        // Drawer'ın içeriğini burada inşa edin
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Örneğin bir DrawerHeader eklenebilir
          Container(
            padding: EdgeInsets.only(top: paddingTop),
            height: 165,
            child: Image.asset(
              "images/intellum.png",
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // Diğer menü öğeleri burada listelenebilir
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: Text('Anasayfa'),
          //   onTap: () {
          //     // Navigasyon işlemleri
          //   },
          // ),
        ],
      ),
    );
  }
}
