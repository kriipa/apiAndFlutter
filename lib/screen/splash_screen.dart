import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furniturezoid/data_source/remote_data_source/user_data_source.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  //   void initState() {
  //     Future.delayed(const Duration(seconds: 5), () {
  //       Navigator.pushReplacementNamed(context, '/LoginPageScreen');
  //     });
  //     super.initState();
  //   }

  String data = " ";


  @override
  void initState() {
    _getTokenFromSharedPref();
    super.initState();
  }

  _getTokenFromSharedPref() async {
    String? token = await UserRemoteDataSource.getTokenFromPrefs();
    if (token != null) {
      setState(() {
        data = token;
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacementNamed(context, '/DashboardScreen');
        });
      });
    } else {
      setState(() {
        data = 'No Data Found';
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacementNamed(context, '/LoginPageScreen');
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Center(
            child: Text('Furniturezoid'),
          ),

          SizedBox(height: 15),
          Center(
            child: SpinKitCubeGrid(
              color: Color.fromARGB(255, 81, 67, 67),
              size: 50.0,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'v18.00.01',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18),
          ),
        ],
      ),
    );
  }
}