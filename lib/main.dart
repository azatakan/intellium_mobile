import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intellium_mobile/admin/pages/onay_form.dart';
import 'package:intellium_mobile/users/splash_screen.dart'; // SplashScreen'ı dahil edin

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // GetMaterialApp kullanıyoruz
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // SplashScreen eklendi
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnayFormlari());
  }
}
