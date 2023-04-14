import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateOrder(),
    );
  }
}

// By Elia Anggaa 
// hi cintakumanisku

// BUAT WARNA GRADIENT
//         appBar: AppBar(
// flexibleSpace: Container(
//   decoration: BoxDecoration(
//     gradient: LinearGradient(
//       colors: [
//         Color.fromARGB(255, 221, 186, 186),
//         Color.fromARGB(255, 255, 255, 255),
//       ],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     ),
//   ),
// ),

class CreateOrder extends StatelessWidget {
  const CreateOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 221, 186, 186),
          centerTitle: true,
          title: Image.asset('assets/img/CCL_logo.png', width: 150),
          leading: PopupMenuButton(
              icon: Icon(Icons.menu, color: Colors.black),
              itemBuilder: (BuildContext) => <PopupMenuEntry>[
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
                  ]),
          actions: <Widget>[
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
        body: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 20),
                          Text(
                            'Cara Pemesanan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("1. Pilih alamat pengambilan Laundry"),
                          Text("2. Pilih Jenis paket Laundry yang diinginkan"),
                          Text(
                              "3. Tekan Pesan jika pesanan sudah sesuai yang diinginkan"),
                          Text(
                              "4. Tunggu 15-30 Menit, dan Kurir akan datang ketempatmu"),
                          Text("5. Cek Status Orderan pada lacak pesanan"),
                          Text(
                              "6. Hubungi nomor 087349762384 jika ada yang ingin ditanyakan atau komplain"),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan alamat Anda',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: 'Paket Pakaian',
                                border: InputBorder.none,
                              ),
                              items: <String>[
                                'None',
                                'Reguler',
                                'Express',
                                'Super Express',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: 'Paket Sepatu',
                                border: InputBorder.none,
                              ),
                              items: <String>[
                                'None',
                                'Reguler',
                                'Express',
                                'Super Express',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10),
                          Text(
                            'Jenis Paket dan Harga',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Paket Laundry Pakaian',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                              "1. Super Express - 3 Jam Pengerjaan - 15.000/kg"),
                          Text("2. Express - 12 Jam Pengerjaan - 10.000/kg"),
                          Text("3. Reguler - 48 Jam Pengerjaan - 5.000/kg"),
                          SizedBox(height: 30),
                          Text(
                            'Paket Laundry Sepatu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                              "1. Super Express - 3 Jam Pengerjaan - 15.000/kg"),
                          Text("2. Express - 24 Jam Pengerjaan - 10.000/kg"),
                          Text("3. Reguler - 72 Jam Pengerjaan - 5.000/kg"),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // fungsinya nanti buat ngebhubugin ke database ama pesanannya langsung ke lacak pesanan
                },
                child: const Text('Pesan'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ]
          )
        )
      )
    );
  }
}
