import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_login_signup/pages/user/HistoryOrder.dart';
import 'package:flutter_login_signup/pages/user/EditProfile.dart';
import 'package:flutter_login_signup/pages/user/CreateOrder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_style.dart';
import 'User.dart';

class TrackOrder extends StatefulWidget {
  static String id = "/trackorder";
  final User? userData;
  
  const TrackOrder({super.key, required this.userData});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
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
                    child: SvgPicture.asset(infoIcon, width: 25),
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('6 KG')),
                DataCell(Text('2 Pasang')),
                DataCell(
                  GestureDetector(
                    onTap: () {
                      _showDetailDialog(context);
                    },
                    child: SvgPicture.asset(infoIcon, width: 25),
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('8 KG')),
                DataCell(Text('3 Pasang')),
                DataCell(
                  GestureDetector(
                    onTap: () {
                      _showDetailDialog(context);
                    },
                    child: SvgPicture.asset(infoIcon, width: 25),
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
