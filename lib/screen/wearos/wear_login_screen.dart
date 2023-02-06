// // import 'package:furniturezoid/screen/wearos/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:wear/wear.dart';
// import '../../helper/shared_preferences.dart';
// import '../../repository/user_repo.dart';

// // import '../../app/snackbar.dart';
// // import '../../repository/student_repo.dart';

// class WearLoginScreen extends StatefulWidget {
//   const WearLoginScreen({super.key});
//   static const String route = "wearLoginScreen";

//   @override
//   State<WearLoginScreen> createState() => _WearLoginScreenState();
// }

// class _WearLoginScreenState extends State<WearLoginScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // final _usernameController = TextEditingController(text: 'kiran');
//   final _emailController = TextEditingController(text: "kripa@gmail.com");
//   final _passwordController = TextEditingController(text: "kripa123");

//   Future<int> loginUser() async {
//     int status = await UserRepositoryImpl()
//         .loginUser(_emailController.text, _passwordController.text);
//     // _showMessage(status != null ? status.uId : 0);
  
//     return status;
//   } 

//   // _login() async {
//   //   final islogin = await UserRepositoryImpl()
//   //       .loginUser(_usernameController.text, _passwordController.text);
//   //   if (islogin) {
//   //     _goToAnotherPage();
//   //   } else {
//   //     _showMessage();
//   //   }
//   // }

//   // _goToAnotherPage() {
//   //   Navigator.pushNamed(context, WearDashboardScreen.route);
//   // }

//   // _showMessage() {
//   //   showSnackbar(context, 'Invalid username or password', Colors.red);
//   // }

//   final _gap = const SizedBox(
//     height: 10,
//   );

//   Map? userData;


//   @override
//   Widget build(BuildContext context) {
//     return WatchShape(
//       builder: ((context, shape, child) {
//         return AmbientMode(
//           builder: ((context, mode, child) {
//             return Scaffold(
//               body: SingleChildScrollView(

//           child: Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     child: Image.network(
//                       'https://i.pinimg.com/564x/3d/23/93/3d23937b872f3446a03730c58f1f68f9.jpg',
//                       height: 500,
//                     ),
//                   ),
//                   _gap,
//                   const Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       hintText: 'email',
//                       fillColor: Colors.grey,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(6),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: Color.fromARGB(255, 94, 70, 70)),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     // obscureText: true,
//                     controller: _passwordController,
//                     decoration: const InputDecoration(
//                       hintText: 'Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(6),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: Color.fromARGB(255, 102, 82, 82)),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter password';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             loginUser().then((value) {
//                               value > 0
//                                   ? {
//                                       userData = <dynamic, dynamic>{},
//                                       userData!['Email'] =
//                                           _emailController.text,
//                                       userData!['Password'] =
//                                           _passwordController.text,
//                                       SharedPref.setMap("userData", userData!),
//                                       // userData =
//                                       //     await SharedPref.getMap("loggedIn"),
//                                       // print(userData)
//                                       Navigator.pushNamedAndRemoveUntil(
//                                           context,
//                                           '/DashboardScreen',
//                                           (Route<dynamic> route) => false)
//                                     }
//                                   : _showMessage(value);
//                             });
//                           }
//                       },
//                       style: const ButtonStyle(
//                           // backgroundColor: Colors.amber,
//                           ),
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(
//                             fontFamily: 'OpenSans-Light', fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account?"),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/RegisterScreen');
//                           },
//                           child: const Text('Sign up',
//                               style: TextStyle(color: Colors.blue)))
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.facebook,
//                               color: Color.fromARGB(255, 0, 0, 0), size: 30)),
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.mail,
//                               color: Color.fromARGB(255, 0, 0, 0), size: 30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//               ),
//             );
//           }),
//         );
//       }),
//     );
//   }
// }