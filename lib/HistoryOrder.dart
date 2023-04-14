import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TrackOrder(),
    );
  }
}

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  Future<void> _showDetailDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail Pesanan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Berat Laundry: 4 KG'),
                Text('Banyak Sepatu: 1 Pasang'),
                Text('Harga: Rp 50,000'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 221, 186, 186),
        centerTitle: true,
        title: Image.asset('assets/img/CCL_logo.png', width: 150),
        leading: PopupMenuButton(
          icon: Icon(Icons.menu, color: Colors.black),
          itemBuilder: (BuildContext) => [
            PopupMenuItem(
              child: Text('Buat Pesanan'),
              value: 1,
            ),
            PopupMenuItem(
              child: Text('Lacak Pesanan'),
              value: 1,
            ),
            PopupMenuItem(
              child: Text('Riwayat Pesanan'),
              value: 1,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  final RenderBox overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox;
                  showMenu(
                    context: context,
                    position: RelativeRect.fromRect(
                      Rect.fromPoints(
                        overlay.localToGlobal(Offset.zero),
                        overlay.localToGlobal(
                            overlay.size.bottomRight(Offset.zero)),
                      ),
                      Offset.zero & overlay.size,
                    ),
                    items: [
                      PopupMenuItem(
                        child: Text('Edit Profil'),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text('Keluar'),
                        value: 2,
                      ),
                    ],
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Angga',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Berat Laundry',
              ),
            ),
            DataColumn(
              label: Text(
                'Banyak Sepatu',
              ),
            ),
            DataColumn(
              label: Text(
                'Detail',
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(Text('4 KG')),
                DataCell(Text('1 Pasang')),
                DataCell(
                  GestureDetector(
                    onTap: () {
                      _showDetailDialog(context);
                    },
                    child: Text('Done'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
