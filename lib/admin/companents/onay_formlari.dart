import 'package:flutter/material.dart';
import 'onay_detaylari.dart';
import 'package:get/get.dart';

class ApprovalTableWidget extends StatelessWidget {
  const ApprovalTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onay Formları',
            style: TextStyle(color: Colors.black)), // AppBar başlığı
        backgroundColor:
            const Color.fromARGB(241, 243, 246, 255), // AppBar arkaplan rengi
        actions: const <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black), // Arama ikonu
            onPressed: null, // TODO: Arama işlevselliği eklenecek
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black), // Filtre ikonu
            onPressed: null, // TODO: Filtre işlevselliği eklenecek
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: const Text('Personel'),
                    onSort: (columnIndex, ascending) {
                      // TODO: Sıralama işlevselliğini buraya ekleyin
                    },
                  ),
                  DataColumn(
                    label: const Text('İzin Türü'),
                    onSort: (columnIndex, ascending) {
                      // TODO: Sıralama işlevselliğini buraya ekleyin
                    },
                  ),
                  DataColumn(
                    label: const Text('İzin Başlangıç Tarihi'),
                    onSort: (columnIndex, ascending) {
                      // TODO: Sıralama işlevselliğini buraya ekleyin
                    },
                  ),
                  DataColumn(
                    label: const Text('İzin Bitiş Tarihi'),
                    onSort: (columnIndex, ascending) {
                      // TODO: Sıralama işlevselliğini buraya ekleyin
                    },
                  ),
                  DataColumn(
                    label: const Text('Durum'),
                    onSort: (columnIndex, ascending) {
                      // TODO: Sıralama işlevselliğini buraya ekleyin
                    },
                  ),
                  DataColumn(
                    label: const Text('Detay'),
                    onSort: (columnIndex, ascending) {
                      // TODO: Sıralama işlevselliğini buraya ekleyin
                    },
                  ),
                ],
                rows: List<DataRow>.generate(
                  1,
                  (index) => DataRow(
                    cells: [
                      const DataCell(Text('Kürşat Demirdelen')),
                      const DataCell(Text('Ücretsiz')),
                      const DataCell(Text('2024-03-13T14:56:14')),
                      const DataCell(Text('2024-03-23T14:56:16')),
                      const DataCell(Text('Declined')),
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.menu_open),
                          onPressed: () {
                            Get.to(() => ApprovalDetailsModel(),
                                transition: Transition.rightToLeft);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          PaginationControl(
            currentPage: 1,
            totalPages: 5,
            onPageChanged: (page) {},
          )
        ],
      ),
    );
  }
}

class PaginationControl extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const PaginationControl({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed:
                currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              '$currentPage',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: currentPage < totalPages
                ? () => onPageChanged(currentPage + 1)
                : null,
          ),
          const SizedBox(width: 24), // Ekstra boşluk
          const Text('5 / sayfa'),
          // Bu kısım DropdownButton veya başka bir widget ile genişletilebilir
        ],
      ),
    );
  }
}
