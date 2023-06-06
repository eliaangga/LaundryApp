import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_login_signup/pages/user/HistoryOrder.dart';
import 'package:flutter_login_signup/pages/user/EditProfile.dart';
import 'package:flutter_login_signup/pages/user/CreateOrder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_style.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class TrackOrder extends StatefulWidget {
  static String id = "/trackorder";
  final User? userData;
  
  const TrackOrder({super.key, required this.userData});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  List<Map<String, dynamic>> orderList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final String apiUrl = 'https://candycrushlaundry.000webhostapp.com/ApiCC/get_by_id?id='+ widget.userData!.id;

    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> dataList = jsonDecode(response.body)['list_product'];
      setState(() {
        orderList = dataList.cast<Map<String, dynamic>>();
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Get Data Failed'),
          content: Text(''),
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


  Future<void> _showDetailDialog(BuildContext context, Map<String, dynamic> orderData) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail Pesanan',
          style: TextStyle(
            fontSize: 16,
          ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Paket Laundry: ${orderData['paket_laundry']}', style: TextStyle(color: Colors.black, fontSize: 12)),
                Text('Berat Laundry: ${orderData['berat_laundry']}', style: TextStyle(color: Colors.black, fontSize: 12)),
                Text('Paket Sepatu: ${orderData['paket_sepatu']}', style: TextStyle(color: Colors.black, fontSize: 12)),
                Text('Banyak Sepatu: ${orderData['banyak_sepatu']}', style: TextStyle(color: Colors.black, fontSize: 12)),
                Text('Alamat Pesanan: ${orderData['alamat_pesanan']}', style: TextStyle(color: Colors.black, fontSize: 12)),
                Text('Total Harga: Rp ${orderData['total_harga']}', style: TextStyle(color: Colors.black, fontSize: 12)),
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
        backgroundColor: Color(0xFFFF6464),
        centerTitle: true,
        title: Image.asset(logoImage2, width: 170),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Status',
              ),
            ),
            DataColumn(
              label: Text(
                'Estimasi',
              ),
            ),
            DataColumn(
              label: Text(
                'Detail',
              ),
            ),
          ],
          rows: orderList.map((orderData) {
            return DataRow(
              cells: [
                DataCell(
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      orderData['status'],
                      style: TextStyle(fontSize: 9, color: Colors.black),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      orderData['estimasi'],
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
                DataCell(
                  GestureDetector(
                    onTap: () {
                      _showDetailDialog(context, orderData);
                    },
                    child: Center(
                      child:SvgPicture.asset(infoIcon, width: 20),
                    ), 
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
