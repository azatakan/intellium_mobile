import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intellium_mobile/admin/companents/custom_buttons.dart';

class ApprovalDetailsModel extends StatelessWidget {
  const ApprovalDetailsModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: const [
                TeslimBilgileri(),
                IzinBilgileri(),
                PersonelBilgileri(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {
                  // Onayla butonuna basıldığında yapılacak işlemler
                },
                text: 'Onayla',
                backgroundcolor: const Color.fromARGB(255, 0, 147, 252),
              ),
              const SizedBox(width: 10), // Butonlar arasındaki boşluk
              CustomButton(
                onTap: () {
                  // Reddet butonuna basıldığında yapılacak işlemler
                },
                text: 'Reddet',
                backgroundcolor: const Color.fromARGB(255, 255, 72, 82),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Diğer widget'ları buraya ekleyin

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Get.back();
        },
      ),
      title: const Text(
        'Onay Detayları',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        TextButton.icon(
          icon: const Icon(Icons.download_rounded, color: Colors.red),
          label: const Text('İzin Tutanağını İndir',
              style: TextStyle(color: Colors.red)),
          onPressed: () {
            // TODO: İzin tutanağını indirme işlevselliği eklenecek
          },
        ),
      ],
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20.0),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}

// TeslimBilgileri, IzinBilgileri, and PersonelBilgileri remain unchanged

class TeslimBilgileri extends StatefulWidget {
  const TeslimBilgileri({super.key});

  @override
  State<TeslimBilgileri> createState() => _TeslimBilgileriState();
}

class _TeslimBilgileriState extends State<TeslimBilgileri> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        //padding: const EdgeInsets.all(100),
        color: const Color.fromARGB(255, 250, 250, 250),
        child: Column(
          children: [
            status(),
            onayTutanagi(),
            izinBaslangicTarihi(),
            izinBitisTarihi(),
          ],
        ),
      ),
    );
  }

  Column izinBitisTarihi() {
    return Column(
      children: [
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Text(
            'İzin Bitiş Tarihi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Row(
            children: [
              Text(
                '23-03-2024',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column izinBaslangicTarihi() {
    return Column(
      children: [
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Text(
            'İzin Başlangıç Tarihi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Text(
            '13-03-2024',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }

  Column status() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Text(
            'Statü',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Row(
            children: [
              Icon(
                Icons.fiber_manual_record,
                size: 12,
                color: Color.fromARGB(255, 147, 97, 217),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Declined',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column onayTutanagi() {
    return Column(
      children: [
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Text(
            'Onay Tutanağı',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 1, // Divider yüksekliği
          color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
          thickness: 1, // Çizgi kalınlığı
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: const Row(
            children: [
              Icon(
                Icons.attach_file,
                size: 18,
                color: Color.fromARGB(255, 147, 97, 217),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'İzin Onay Tutanağı.pdf',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class IzinBilgileri extends StatefulWidget {
  const IzinBilgileri({super.key});

  @override
  State<IzinBilgileri> createState() => _IzinBilgileriState();
}

class _IzinBilgileriState extends State<IzinBilgileri> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        //padding: const EdgeInsets.all(100),
        color: const Color.fromARGB(255, 250, 250, 250),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'İzin Türü',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        'Ücretsiz',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'Açıklama',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        'Deneme Adres 1',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'İzinde Bulunacağı Adres',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        'asfsafasfasfa',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PersonelBilgileri extends StatefulWidget {
  const PersonelBilgileri({super.key});

  @override
  State<PersonelBilgileri> createState() => _PersonelBilgileriState();
}

class _PersonelBilgileriState extends State<PersonelBilgileri> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        //padding: const EdgeInsets.all(100),
        color: const Color.fromARGB(255, 250, 250, 250),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    '#ID',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        '684684384384',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'Ad Soyad',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        'Kürşat Demirdelen',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'E-Posta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        'asfas@saf.co',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'Telefon Numarası',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        '412421412421',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    'İzin Belgeleri',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1, // Divider yüksekliği
                  color: Color.fromARGB(255, 225, 225, 225), // Çizgi rengi
                  thickness: 1, // Çizgi kalınlığı
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Row(
                    children: [
                      Text(
                        '(Belge adresidfghjkl)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
