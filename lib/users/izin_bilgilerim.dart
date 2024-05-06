import 'package:flutter/material.dart';
import 'package:intellium_mobile/users/izin_sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'İzin Bilgileri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IzinBilgileri(),
    );
  }
}

class IzinBilgileri extends StatelessWidget {
  // Örnek veriler
  final List<IzinBilgi> izinler = [
    IzinBilgi(
      icon: Icons.calendar_month,
      text: 'Toplam Ücretli İzin Hakkı',
      count: 20,
      color: Colors.green, // Örnek: Turuncu renk
    ),
    IzinBilgi(
      icon: Icons.calendar_today_outlined,
      text: 'Transfer Edilen Ücretli İzin Hakkı',
      count: 5,
      color: Colors.blue, // Örnek: Yeşil renk
    ),
    IzinBilgi(
      icon: Icons.person,
      text: 'Bu Sene Kazanılan Ücretli İzin Hakkı',
      count: 10,
      color: Colors.teal, // Örnek: Mavi renk
    ),
    IzinBilgi(
      icon: Icons.list_alt_rounded,
      text: 'Kalan Ücretli İzin Hakkı',
      count: 5,
      color: Colors.red, // Örnek: Kırmızı renk
    ),
    IzinBilgi(
      icon: Icons.check_box,
      text: 'Kullanılan Ücretli İzin Hakkı',
      count: 15,
      color: Colors.green, // yeşil renk
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İzin Bilgilerim'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var izin in izinler) _buildIzinKare(izin),
              SizedBox(height: 20),
              // Butonun sağ tarafa kaydırılması için Row kullanalım
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IzinSayfasi()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Buton arka plan rengi
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30), // Buton iç boşluğu
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Buton kenar yuvarlaklığı
                      ),
                      elevation: 5, // Butonun yükseltilme miktarı
                    ),
                    icon: Icon(Icons.edit), // Buton ikonu
                    label: Text(
                      'İzin Talep Et',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Buton metin rengi
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIzinKare(IzinBilgi izin) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 39, 63, 77),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: izin.color, // İkon için belirlenen renk
            ),
            child: Icon(
              izin.icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  izin.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${izin.count} gün',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IzinBilgi {
  final IconData icon;
  final String text;
  final int count;
  final Color color; // Renk özelliği eklendi

  IzinBilgi({
    required this.icon,
    required this.text,
    required this.count,
    required this.color, // Renk özelliği eklendi
  });
}

class IzinTalebiSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İzin Talebi'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'İzin talebi sayfası',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
