import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_login_signup/pages/user/HistoryOrder.dart';
import 'package:flutter_login_signup/pages/user/EditProfile.dart';
import 'package:flutter_login_signup/pages/user/TrackOrder.dart';
import '../../app_style.dart';
import 'User.dart';

class CreateOrder extends StatefulWidget {
  static String id = "/createorder";
  final User? userData;
  const CreateOrder({super.key, required this.userData});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6464),
          centerTitle: true,
          title: Image.asset(
            logoImage2,
            width: 170,
          ),
          leading: PopupMenuButton(
              onSelected: (result) {
                if (result == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateOrder(userData: widget.userData),
                    ),
                  );
                } else if (result == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackOrder(userData: widget.userData),
                    ),
                  );
                } else if (result == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryOrder(userData: widget.userData),
                    ),
                  );
                }
              },
              icon: Icon(Icons.menu, color: Colors.white),
              itemBuilder: (BuildContext) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Text('Buat Pesanan',
                          style: TextStyle(color: Color(0xFFFF6464))),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Lacak Pesanan',
                          style: TextStyle(color: Color(0xFFFF6464))),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text('Riwayat Pesanan',
                          style: TextStyle(color: Color(0xFFFF6464))),
                      value: 3,
                    ),
                  ]),
          actions: <Widget>[
            Row(
              children: [
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: Text('Edit Profil',
                          style: TextStyle(color: Color(0xFFFF6464))),
                      value: 4,
                    ),
                    PopupMenuItem(
                      child: Text('Keluar',
                          style: TextStyle(color: Color(0xFFFF6464))),
                      value: 5,
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(userData: widget.userData),
                        ),
                      );
                    } else if (value == 5) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(Login.id, (route) => false);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.userData!.username,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: const Text('US'),
                      )
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
                          const SizedBox(width: 12),
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
                                  child: Text(
                                      style:
                                          TextStyle(color: Color(0xFFFF6464)),
                                      value),
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
                                  child: Text(
                                      style:
                                          TextStyle(color: Color(0xFFFF6464)),
                                      value),
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
            ]))));
  }
}
