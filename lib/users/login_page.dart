import 'package:flutter/material.dart';
import 'package:intellium_mobile/admin/pages/onay_form.dart';
import 'package:intellium_mobile/users/account_recovery.dart';
import 'package:intellium_mobile/users/dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username; // Kullanıcının girdiği kullanıcı adını tutacak değişken
  String? password; // Kullanıcının girdiği şifreyi tutacak değişken
  final _formKey =
      GlobalKey<FormState>(); // Formun durumunu izlemek için global anahtar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Klavye açıldığında ekran boyutunu değiştirme
      body: Form(
        key: _formKey, // Formun key değeri
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "LOGIN", // Başlık metni
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextFormField(
                autovalidateMode: AutovalidateMode
                    .onUserInteraction, // Otomatik doğrulama modu
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Kullanıcı Adı", // Label metni
                  labelStyle: TextStyle(color: Colors.purple), // Label stil
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kullanıcı Adınızı Giriniz"; // Doğrulama hatası mesajı
                  } else {
                    return null; // Geçerli değer
                  }
                },
                onSaved: (value) {
                  username = value; // Değer kaydedici
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                autovalidateMode: AutovalidateMode
                    .onUserInteraction, // Otomatik doğrulama modu
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Şifre", // Label metni
                  labelStyle: TextStyle(color: Colors.purple), // Label stil
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                obscureText: true, // Şifrenin gizlenmesi
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Şifrenizi Giriniz"; // Doğrulama hatası mesajı
                  } else {
                    return null; // Geçerli değer
                  }
                },
                onSaved: (value) {
                  password = value; // Değer kaydedici
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (username == 'user' && password == '1234') {
                      // Kullanıcı adı ve şifre doğruysa users sayfasına yönlendir
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardPage(),
                        ),
                      );
                    } else if (username == 'admin' && password == '1234') {
                      // Admin kullanıcı adı ve şifre doğruysa Admin sayfasına yönlendir
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnayFormlari(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Hata"), // Hata başlığı
                            content: Text(
                                "Kullanıcı Adı veya Şifre Hatalıdır"), // Hata içeriği
                            actions: <Widget>[
                              TextButton(
                                child: Text("Geri Dön"), // Geri dönüş butonu
                                onPressed: () =>
                                    Navigator.pop(context), // Geri dönüş işlemi
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: Text("Giriş Yap"), // Giriş yap buton metni
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Buton rengi
                  padding: EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15.0), // Buton iç boşlukları
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AccountRecoveryPage()), // Şifre Kurtarma Sayfasına yönlendirme
                  );
                },
                child: Text(
                  "Şifremi Unuttum?", // "Şifremi Unuttum?" link metni
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
