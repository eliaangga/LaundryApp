import 'package:flutter/material.dart';
import '../../app_style.dart';
import '../login/login.dart';
import '../user/CreateOrder.dart';
import '../user/EditProfile.dart';
import '../user/HistoryOrder.dart';
import '../user/TrackOrder.dart';

class LandingPage extends StatefulWidget {
  static String id = "/landingpage";
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentPageIndex = 0;
  final List<String> _imageList = [
    'assets/images/laundry1.png',
    'assets/images/laundry2.png',
    'assets/images/laundry3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6464),
        centerTitle: true,
        title: Image.asset(
          logoImage2,
          width: 170,
        ),
        leading: PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (result) {
            if (result == 1) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LandingPage.id, (route) => false);
            } else if (result == 2) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(CreateOrder.id, (route) => false);
            } else if (result == 3) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(TrackOrder.id, (route) => false);
            } else if (result == 4) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(HistoryOrder.id, (route) => false);
            }
          },
          icon: const Icon(Icons.menu, color: Colors.white),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              child:
                  Text('Beranda', style: TextStyle(color: Color(0xFFFF6464))),
              value: 1,
            ),
            const PopupMenuItem(
              child: Text('Buat Pesanan',
                  style: TextStyle(color: Color(0xFFFF6464))),
              value: 2,
            ),
            const PopupMenuItem(
              child: Text('Lacak Pesanan',
                  style: TextStyle(color: Color(0xFFFF6464))),
              value: 3,
            ),
            const PopupMenuItem(
              child: Text('Riwayat Pesanan',
                  style: TextStyle(color: Color(0xFFFF6464))),
              value: 4,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Edit Profil',
                    style: TextStyle(color: Color(0xFFFF6464))),
                value: 4,
              ),
              const PopupMenuItem(
                child:
                    Text('Keluar', style: TextStyle(color: Color(0xFFFF6464))),
                value: 5,
              ),
            ],
            onSelected: (value) {
              if (value == 4) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(EditProfile.id, (route) => false);
              } else if (value == 5) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Login.id, (route) => false);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'User',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('US'),
                )
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  itemCount: _imageList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_imageList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: const [
                          SizedBox(height: 15),
                          Text(
                            'CandyCrush Laundry',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Color(0xFFFF6464),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cuci kilat harga bersahabat',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Poppins',
                              color: Color(0xFFFF6464),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: ListView(
                          scrollDirection:
                              Axis.vertical, // Set vertical scroll direction
                          children: [
                            _buildCard(
                              context,
                              image: 'assets/images/laundry1.png',
                              title: 'Buat Pesanan',
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  CreateOrder.id,
                                  (route) => false,
                                );
                              },
                            ),
                            _buildCard(
                              context,
                              image: 'assets/images/laundry3.png',
                              title: 'Lacak Pesanan',
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  TrackOrder.id,
                                  (route) => false,
                                );
                              },
                            ),
                            _buildCard(
                              context,
                              image: 'assets/images/laundry2.png',
                              title: 'Riwayat Pesanan',
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  HistoryOrder.id,
                                  (route) => false,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _imageList.length; i++) {
      list.add(
        i == _currentPageIndex
            ? const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.circle, size: 12, color: Colors.red),
              )
            : const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.circle, size: 10, color: Colors.grey),
              ),
      );
    }
    return list;
  }

  Widget _buildCard(BuildContext context,
      {required String image,
      required String title,
      required Function onPressed}) {
    return Card(
      child: InkWell(
        onTap: () => onPressed(),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            Text(title),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => onPressed(),
              child: Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}
