import 'package:flutter/material.dart'; // Flutter materyal kütüphanesi

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Hata ayıklama bandını kapat
      home: IzinSayfasi(), // Ana uygulama sayfası
    );
  }
}

class IzinSayfasi extends StatefulWidget {
  const IzinSayfasi({super.key});

  @override
  _IzinSayfasiState createState() => _IzinSayfasiState();
}

class _IzinSayfasiState extends State<IzinSayfasi> {
  String _selectedType = ''; // Seçilen izin tipi
  String _selectedMazeret = ''; // Seçilen mazeret
  DateTime? _startDate; // Başlangıç tarihi
  DateTime? _endDate; // Bitiş tarihi
  TimeOfDay? _startTime; // Başlangıç saati
  TimeOfDay? _endTime; // Bitiş saati
  String _adres = ''; // Adres
  String _telefon = ''; // Telefon numarası
  String _eposta = ''; // E-posta adresi
  String _aciklama = ''; // Mazeret açıklaması

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedStartDate != null) {
      setState(() {
        _startDate = pickedStartDate;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedEndDate != null) {
      setState(() {
        _endDate = pickedEndDate;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedStartTime != null) {
      setState(() {
        _startTime = pickedStartTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedEndTime != null) {
      setState(() {
        _endTime = pickedEndTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'İzin Talebi', // Sayfa başlığı
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue, // AppBar arka plan rengi
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Geri dönüş ikonu
          onPressed: () {
            Navigator.pop(context); // Sayfadan çıkış
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Kenarlık rengi
                borderRadius: BorderRadius.circular(10), // Köşe yuvarlaklığı
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'İzin Tipi', // İzin tipi başlığı
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile(
                        title:
                            const Text('Ücretli İzin'), // Ücretli izin seçeneği
                        value: 'Ücretli',
                        groupValue: _selectedType,
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value.toString();
                            _selectedMazeret = '';
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text(
                            'Ücretsiz İzin'), // Ücretsiz izin seçeneği
                        value: 'Ücretsiz',
                        groupValue: _selectedType,
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value.toString();
                            _selectedMazeret = '';
                          });
                        },
                      ),
                      if (_selectedType == 'Ücretli' ||
                          _selectedType == 'Ücretsiz')
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Başlangıç Tarihi', // Başlangıç tarihi başlığı
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _selectStartDate(context);
                                    },
                                    icon: const Icon(
                                        Icons.calendar_today), // Takvim ikonu
                                    label: const Text(
                                        'Başlangıç Tarihi Seç'), // Başlangıç tarihi seç butonu
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _startDate != null
                                        ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                                        : 'Başlangıç tarihi seçilmedi', // Başlangıç tarihi
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 40),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _selectEndDate(context);
                                    },
                                    icon: const Icon(
                                        Icons.calendar_today), // Takvim ikonu
                                    label: const Text(
                                        'Bitiş Tarihi Seç'), // Bitiş tarihi seç butonu
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    _endDate != null
                                        ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                                        : 'Bitiş tarihi seçilmedi', // Bitiş tarihi
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      RadioListTile(
                        title:
                            const Text('Mazeret İzni'), // Mazeret izni seçeneği
                        value: 'Mazeretli',
                        groupValue: _selectedType,
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedType == 'Mazeretli')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mazeret İzin Tipi', // Mazeret izni tipi başlığı
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile(
                        title:
                            const Text('Evlilik'), // Evlilik mazeret seçeneği
                        value: 'Evlilik',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text(
                            'Birinci Derece Yakınının Vefatı'), // Birinci derece yakınının vefatı mazeret seçeneği
                        value: 'Birinci Derece Yakınının Vefatı',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                      if (_selectedMazeret == 'Birinci Derece Yakınının Vefatı')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Açıklama', // Açıklama etiketi
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _aciklama = value;
                                });
                              },
                              maxLines: 3,
                              decoration: const InputDecoration(
                                hintText:
                                    'Lütfen izin talep sebebinizi kısaca açıklayınız!', // Açıklama için yer tutucu metin
                                border:
                                    OutlineInputBorder(), // Kenarlık stilini belirtir
                              ),
                            ),
                          ],
                        ),
                      RadioListTile(
                        title: const Text(
                            'Çocuğunun Evlenmesi'), // Çocuğunun evlenmesi mazeret seçeneği
                        value: 'Çocuğunun Evlenmesi',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text(
                            'Ev Değiştirilmesi'), // Ev değiştirilmesi mazeret seçeneği
                        value: 'Ev Değiştirilmesi',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                      RadioListTile(
                        title:
                            const Text('Hastalık'), // Hastalık mazeret seçeneği
                        value: 'Hastalık',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                      if (_selectedMazeret == 'Hastalık')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Açıklama', // Açıklama etiketi
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _aciklama = value;
                                });
                              },
                              maxLines: 3,
                              decoration: const InputDecoration(
                                hintText:
                                    'Lütfen hastalık durumunuzu kısaca açıklayınız!', // Açıklama için yer tutucu metin
                                border:
                                    OutlineInputBorder(), // Kenarlık stilini belirtir
                              ),
                            ),
                          ],
                        ),
                      RadioListTile(
                        title: const Text(
                            'Doğal Afetlere Uğraması'), // Doğal afetlere uğraması mazeret seçeneği
                        value: 'Doğal Afetlere Uğraması',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                          });
                        },
                      ),
                      if (_selectedMazeret == 'Doğal Afetlere Uğraması')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Açıklama', // Açıklama etiketi
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _aciklama = value;
                                });
                              },
                              maxLines: 3,
                              decoration: const InputDecoration(
                                hintText:
                                    'Lütfen izin talep sebebinizi kısaca açıklayınız!', // Açıklama için yer tutucu metin
                                border:
                                    OutlineInputBorder(), // Kenarlık stilini belirtir
                              ),
                            ),
                          ],
                        ),
                      RadioListTile(
                        title:
                            const Text('Süt İzni'), // Süt izni mazeret seçeneği
                        value: 'Süt İzni',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text(
                            'Saatlik İzin'), // Saatlik izin mazeret seçeneği
                        value: 'Saatlik İzin',
                        groupValue: _selectedMazeret,
                        onChanged: (value) {
                          setState(() {
                            _selectedMazeret = value.toString();
                            _adres = '';
                            _telefon = '';
                            _eposta = '';
                            _aciklama = '';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_selectedMazeret == 'Evlilik' ||
                _selectedMazeret == 'Çocuğunun Evlenmesi' ||
                _selectedMazeret == 'Ev Değiştirilmesi' ||
                _selectedMazeret == 'Saatlik İzin' ||
                _selectedMazeret == 'Süt İzni')
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tarih ve Saat', // Tarih ve saat başlığı
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            _selectStartDate(context);
                            _selectStartTime(context);
                          },
                          icon:
                              const Icon(Icons.calendar_today), // Takvim ikonu
                          label: const Text(
                              'Başlangıç Tarihi ve Saatini Seç'), // Başlangıç tarihi ve saatini seç butonu
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _startDate != null && _startTime != null
                              ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year} - ${_startTime!.hour}:${_startTime!.minute}'
                              : 'Başlangıç tarihi ve saati seçilmedi', // Başlangıç tarihi ve saati
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        ElevatedButton.icon(
                          onPressed: () {
                            _selectEndDate(context);
                            _selectEndTime(context);
                          },
                          icon:
                              const Icon(Icons.calendar_today), // Takvim ikonu
                          label: const Text(
                              'Bitiş Tarihi ve Saatini Seç'), // Bitiş tarihi ve saatini seç butonu
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _endDate != null && _endTime != null
                              ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year} - ${_endTime!.hour}:${_endTime!.minute}'
                              : 'Bitiş tarihi ve saati seçilmedi', // Bitiş tarihi ve saati
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_selectedMazeret == 'Evlilik' ||
                _selectedMazeret == 'Çocuğunun Evlenmesi' ||
                _selectedMazeret == 'Ev Değiştirilmesi' ||
                _selectedMazeret == 'Saatlik İzin' ||
                _selectedMazeret == 'Süt İzni')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'İzinde Bulunacağı Adres', // İzinde bulunacağı adres başlığı
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _adres = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText:
                          'İzinli dönemde kalacağınız adresi yazınız!', // Adres için yer tutucu metin
                      border: OutlineInputBorder(), // Kenarlık stilini belirtir
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_selectedMazeret == 'Evlilik' ||
                _selectedMazeret == 'Çocuğunun Evlenmesi' ||
                _selectedMazeret == 'Ev Değiştirilmesi' ||
                _selectedMazeret == 'Saatlik İzin' ||
                _selectedMazeret == 'Süt İzni')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Telefon Numarası', // Telefon numarası başlığı
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _telefon = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText:
                          'Telefon Numarası', // Telefon numarası için yer tutucu metin
                      border: OutlineInputBorder(), // Kenarlık stilini belirtir
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_selectedMazeret == 'Evlilik' ||
                _selectedMazeret == 'Çocuğunun Evlenmesi' ||
                _selectedMazeret == 'Ev Değiştirilmesi' ||
                _selectedMazeret == 'Saatlik İzin' ||
                _selectedMazeret == 'Süt İzni')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'E-posta Adresi', // E-posta adresi başlığı
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _eposta = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText:
                          'E-posta Adresi', // E-posta adresi için yer tutucu metin
                      border: OutlineInputBorder(), // Kenarlık stilini belirtir
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_selectedMazeret == 'Evlilik' ||
                _selectedMazeret == 'Çocuğunun Evlenmesi' ||
                _selectedMazeret == 'Ev Değiştirilmesi' ||
                _selectedMazeret == 'Saatlik İzin' ||
                _selectedMazeret == 'Süt İzni')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'İzin Belgeleri', // İzin belgeleri başlığı
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Dosya ekleme işlemi
                    },
                    icon: const Icon(Icons.attach_file), // Dosya ekleme ikonu
                    label: const Text('Dosya Ekle'), // Dosya ekle butonu
                  ),
                ],
              ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Buton arka plan rengi
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30), // Buton iç boşluğu
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Buton kenar yuvarlaklığı
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  print('Tür: $_selectedType'); // Seçilen izin tipini yazdır
                  if (_selectedType == 'Mazeretli') {
                    print(
                        'Mazeret: $_selectedMazeret'); // Mazeret izni durumunda seçilen mazereti yazdır
                    if (_selectedMazeret == 'Doğal Afetlere Uğraması' ||
                        _selectedMazeret == 'Birinci Derece Yakınının Vefatı') {
                      print(
                          'Açıklama: $_aciklama'); // Belirli mazeretler için açıklamayı yazdır
                    }
                  }
                  if (_startDate != null && _endDate != null) {
                    print(
                        'Başlangıç Tarihi: ${_startDate!.day}/${_startDate!.month}/${_startDate!.year} - '
                        '${_startTime!.hour}:${_startTime!.minute}'); // Başlangıç tarihini ve saatini yazdır
                    print(
                        'Bitiş Tarihi: ${_endDate!.day}/${_endDate!.month}/${_endDate!.year} - '
                        '${_endTime!.hour}:${_endTime!.minute}'); // Bitiş tarihini ve saatini yazdır
                  }
                  print('Adres: $_adres'); // Adresi yazdır
                  print('Telefon: $_telefon'); // Telefon numarasını yazdır
                  print('E-posta: $_eposta'); // E-posta adresini yazdır
                },
                child: const Text(
                  'İzin Talep Et', // Gönder butonu metni
                  style: TextStyle(
                    fontSize: 18, // Buton metni boyutu
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Buton metni kalınlığı
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
