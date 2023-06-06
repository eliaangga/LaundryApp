import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_login_signup/pages/user/HistoryOrder.dart';
import 'package:flutter_login_signup/pages/user/EditProfile.dart';
import 'package:flutter_login_signup/pages/user/TrackOrder.dart';
import '../../app_style.dart';
import 'package:http/http.dart' as http;

import '../landingpage/landingpage.dart';
import 'User.dart';

class CreateOrder extends StatefulWidget {
  static String id = "/createorder";
  final User? userData;
  const CreateOrder({Key? key, required this.userData}) : super(key: key);

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  String pLaundryController = "";
  String pSepatuController = "";

  Future<void> createOrder() async {
    final int idUser = int.parse(widget.userData!.id);
    final String alamat = widget.userData!.address;
    final String pLaundry = pLaundryController;
    final int bLaundry = 0;
    final String pSepatu = pSepatuController;
    final int bSepatu = 0;

    // Ganti URL_API dengan URL API yang sesuai
    final String apiUrl = 'https://candycrushlaundry.000webhostapp.com/ApiCC/';
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "id_user": idUser,
        "paket_laundry": pLaundry,
        "berat_laundry": bLaundry,
        "paket_sepatu": pSepatu,
        "banyak_sepatu": bSepatu,
        "alamat_pesanan": alamat,
        "status": "",
        "estimasi": "",
        "total_harga": 0,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(userData: widget.userData),
          ),
        );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Creating Order Failed'),
          content: Text('Invalid response data.', style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
              child: Text(
                'Buat Pesanan',
                style: TextStyle(color: Color(0xFFFF6464)),
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Text(
                'Lacak Pesanan',
                style: TextStyle(color: Color(0xFFFF6464)),
              ),
              value: 2,
            ),
            PopupMenuItem(
              child: Text(
                'Riwayat Pesanan',
                style: TextStyle(color: Color(0xFFFF6464)),
              ),
              value: 3,
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            children: [
              PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text(
                      'Edit Profil',
                      style: TextStyle(color: Color(0xFFFF6464)),
                    ),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Keluar',
                      style: TextStyle(color: Color(0xFFFF6464)),
                    ),
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
                    Navigator.of(context).pushNamedAndRemoveUntil(Login.id, (route) => false);
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
          child: Column(
            children: [
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
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Cara Pemesanan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("1. Pilih alamat pengambilan Laundry",
                          style: TextStyle(fontSize: 13),
                          ),
                          Text("2. Pilih Jenis paket Laundry yang diinginkan",
                          style: TextStyle(fontSize: 13),
                          ),
                          Text("3. Tekan Pesan jika pesanan sudah sesuai yang diinginkan",
                          style: TextStyle(fontSize: 13),
                          ),
                          Text("4. Tunggu 15-30 Menit, dan Kurir akan datang ketempatmu",
                          style: TextStyle(fontSize: 13),
                          ),
                          Text("5. Cek Status Orderan pada lacak pesanan",
                          style: TextStyle(fontSize: 13),
                          ),
                          Text("6. Hubungi nomor 087349762384 jika ada yang ingin ditanyakan atau komplain",
                          style: TextStyle(fontSize: 13),
                          ),
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
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(color: Colors.red),
                      decoration: InputDecoration(
                        hintText: 'Masukkan alamat Anda',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Menyesuaikan padding konten
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
                              style: TextStyle(fontSize: 10),
                              decoration: const InputDecoration(
                                hintText: 'Paket Pakaian',
                                hintStyle: TextStyle(fontSize: 15),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 5.0),
                                isDense: true,
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
                                    value,
                                    style: TextStyle(color: Color(0xFFFF6464),
                                    fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  pLaundryController = value ?? '';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              style: TextStyle(fontSize: 10),
                              decoration: const InputDecoration(
                                hintText: 'Paket Sepatu',
                                hintStyle: TextStyle(fontSize: 15),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 5.0),
                                isDense: true,
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
                                    value,
                                    style: TextStyle(color: Color(0xFFFF6464),
                                    fontSize: 15,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  pSepatuController = value ?? '';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                        children: [
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
                          Text("1. Super Express - 3 Jam Pengerjaan - 15.000/kg"),
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
                          Text("1. Super Express - 3 Jam Pengerjaan - 15.000/kg"),
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
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    createOrder();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('Pesan'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Pesanan anda akan kami antar dalam waktu 15-30 Menit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
