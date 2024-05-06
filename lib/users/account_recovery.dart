import 'package:flutter/material.dart';
import 'login_page.dart'; // Login sayfasının import edilmesi

class AccountRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifremi Unuttum'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Şirket logosu veya başlık
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Intellium',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Intellium yazısını mavi renk yapma
                ),
              ),
            ),
            // Mail giriş alanı
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            // Şifre sıfırlama butonu
            ElevatedButton(
              onPressed: () {
                // Burada şifre sıfırlama işlemleri yapılabilir
                // Örneğin: kullanıcının mailine şifre sıfırlama linki gönderme
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Butonun arka plan rengini mavi yapma
              ),
              child: Text(
                'Maili Gönderin',
                style:
                    TextStyle(color: Colors.white), // Buton metnini beyaz yapma
              ),
            ),
            SizedBox(height: 20.0),
            // Giriş yapma kısmı
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                'Giriş Yap',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
