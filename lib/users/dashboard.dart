import 'package:flutter/material.dart';
import 'package:intellium_mobile/users/izin_bilgilerim.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menü',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Yazı rengini beyaz yap
          ),
        ), // Kontrol sayfası adı
        backgroundColor: Colors.blue, // App bar arka plan rengini siyah yap
      ),
      body: GridView.count(
        crossAxisCount: 2, // 2 sütunlu bir grid oluşturur
        mainAxisSpacing: 20.0, // Dikeydeki (ana) kutu aralığı
        crossAxisSpacing: 20.0, // Yataydaki (çapraz) kutu aralığı
        padding: const EdgeInsets.all(20.0), // Tüm kenarlara iç boşluk ekler
        children: [
          // İstek Kutusu kutusu
          _buildDashboardItem(
            icon: Icons.inbox,
            title: 'İzinler',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IzinBilgileri()),
              );
              // İstek kutusu sayfasına yönlendirme yapılabilir
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3, // Kartın yükseltilmesi
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // Kartın kenar yuvarlaklığı
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
