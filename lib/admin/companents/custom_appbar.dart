// lib/components/approval_app_bar.dart
import 'package:flutter/material.dart';

class ApprovalAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // AppBar'ın boyutunu belirtmek için kullanılır.

  const ApprovalAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu), // Menü butonu ikonu
        onPressed: () => Scaffold.of(context).openDrawer(),
      ), // AppBar başlığı
      backgroundColor: Colors.white, // AppBar arkaplan rengi
      iconTheme: const IconThemeData(
          color: Colors.black), // AppBar'daki ikonların teması
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search), // Arama ikonu
          onPressed: () {
            // TODO: Arama işlevselliği eklenecek
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications), // Bildirim ikonu
          onPressed: () {
            // TODO: Bildirim işlevselliği eklenecek
          },
        ),
        const CircleAvatar(
          backgroundColor: Colors.green, // Örnek bir arkaplan rengi
          // TODO: Kullanıcının profil fotoğrafı yüklenecek
          child: Text(
            'A', // İlk harf olarak örnek bir metin
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
            width: 20), // Profil fotoğrafı ile ekranın kenarı arasında boşluk
      ],
    );
  }
}
