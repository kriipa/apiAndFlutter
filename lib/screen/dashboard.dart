import 'package:flutter/material.dart';
// import 'package:plants/helper/shared_pref.dart';

// import 'package:plants/screen/profilescreen.dart';

import '../data_source/remote_data_source/user_data_source.dart';
import '../helper/shared_preferences.dart';
import 'bottom_screen/cart.dart';
import 'bottom_screen/home.dart';
import 'bottom_screen/profile.dart';
// import 'cartscreen.dart';
// import 'homescreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

    static const String route = "dashboardScreen";


  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String searchValue = '';
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  SharedPref prefs = SharedPref();
  bool? loggedIn;
  @override
  void initState() {
    super.initState();
  }

  Map userInfo = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: const Color.fromARGB(255, 89, 67, 39),
        centerTitle: true,
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     userInfo = await SharedPref.getMap("userData");
          //     Navigator.pushReplacementNamed(context, '/LoginScreen');
          //     print(userInfo);
          //   },
          //   icon: const Icon(Icons.login),
          // )
          IconButton(
              onPressed: () async {
                String? token = await UserRemoteDataSource.getTokenFromPrefs();
            debugPrint(token);
              },
              icon: const Icon(Icons.key)),
          IconButton(
              onPressed: () async {
                await SharedPref.clearSharedPref();
                Navigator.pushReplacementNamed(context, '/LoginPageScreen');
              },
              icon: const Icon(Icons.logout_rounded)),
        ],
      ),
      // body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 74, 54, 24),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}