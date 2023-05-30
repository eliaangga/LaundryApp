import 'package:flutter/material.dart';
import '../../app_style.dart';
import '../login/login.dart';
import '../user/CreateOrder.dart';
import '../user/EditProfile.dart';
import '../user/HistoryOrder.dart';
import '../user/TrackOrder.dart';
import '../user/User.dart';

class LandingPage extends StatefulWidget {
  static String id = "/landingpage";
  final User? userData;

  const LandingPage({Key? key, required this.userData}) : super(key: key);
  
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPage(userData: widget.userData),
                ),
              );
            } else if (result == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOrder(userData: widget.userData),
                ),
              );
            } else if (result == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrackOrder(userData: widget.userData),
                ),
              );
            } else if (result == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryOrder(userData: widget.userData),
                ),
              );
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
              children:  [
                Text(
                  widget.userData!.username,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
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
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Apps',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MenuCard(
                        icon: Icons.add_shopping_cart,
                        title: 'Buat Pesanan',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateOrder(userData: widget.userData),
                            ),
                          );
                        },
                      ),
                      MenuCard(
                        icon: Icons.location_on,
                        title: 'Lacak Pesanan',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrackOrder(userData: widget.userData),
                            ),
                          );
                        },
                      ),
                      MenuCard(
                        icon: Icons.history,
                        title: 'Riwayat Pesanan',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryOrder(userData: widget.userData),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          20.0), // Tambahkan spasi antara menu Apps dan menu Survey
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MenuCard(
                        icon: Icons.question_answer,
                        title: 'Customer Feedback',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          40.0), // Tambahkan spasi antara menu Survey dan menu Berita Terbaru
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Berita Terbaru',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MenuCard(
                        icon: Icons.article,
                        title: 'News 1',
                        onTap: () {
                          // Navigasi ke halaman News 1
                        },
                      ),
                      MenuCard(
                        icon: Icons.article,
                        title: 'News 2',
                        onTap: () {
                          // Navigasi ke halaman News 2
                        },
                      ),
                      MenuCard(
                        icon: Icons.article,
                        title: 'News 3',
                        onTap: () {
                          // Navigasi ke halaman News 3
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _imageList.length; i++) {
      indicators.add(
        i == _currentPageIndex
            ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.circle,
                  size: 12,
                  color: Colors.red,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
      );
    }
    return indicators;
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuCard(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2.0,
        child: Container(
          width: double.infinity,
          height: 96,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  SizedBox(height: 10.0),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}