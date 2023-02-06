import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Aesthetic Furniture",
                  style: TextStyle(
                    color: Color.fromARGB(255, 124, 85, 75),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Text(
                  'Designs',
                  style: TextStyle(
                    color: Color.fromARGB(255, 81, 60, 55),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../data_source/remote_data_source/user_data_source.dart';

// import 'package:furniturezoid/utils/product_category.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final List _product_list = [
//     {
//       'product_name': 'Levi\'s black jeans',
//       'price': 2500,
//       'image':
//           'https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/224x336/M56115.jpg'
//     },
//     {
//       'product_name': 'One Piece',
//       'price': 3000,
//       'image':
//           'https://rukminim1.flixcart.com/image/612/612/xif0q/dress/d/f/n/s-527-doyal-collections-original-imaghf6zxqegx4ut.jpeg?q=70'
//     },
//     {
//       'product_name': 'Long Coat',
//       'price': 4000,
//       'image':
//           'https://i.pinimg.com/originals/cd/09/d6/cd09d6802b35eee82de0e510429c7420.jpg'
//     },
//     {
//       'product_name': 'Cardigan',
//       'price': 2700,
//       'image': 'https://cdn.store-assets.com/s/289549/i/18267555.jpg?width=1024'
//     },
//     {
//       'product_name': 'Levi\'s black jeans',
//       'price': 2500,
//       'image':
//           'https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/224x336/M56115.jpg'
//     },
//     {
//       'product_name': 'Levi\'s black jeans',
//       'price': 2500,
//       'image':
//           'https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/224x336/M56115.jpg'
//     },
//     {
//       'product_name': 'Levi\'s black jeans',
//       'price': 2500,
//       'image':
//           'https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/224x336/M56115.jpg'
//     },
//     {
//       'product_name': 'Levi\'s black jeans',
//       'price': 2500,
//       'image':
//           'https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/224x336/M56115.jpg'
//     },
//     {
//       'product_name': 'Levi\'s black jeans',
//       'price': 2500,
//       'image':
//           'https://xcdn.next.co.uk/Common/Items/Default/Default/ItemImages/Search/224x336/M56115.jpg'
//     },
//   ];

//   @override
//   Widget build(BuildContext  context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'TailorMADE',
//         ),
//         titleTextStyle: const TextStyle(
//             color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 await UserRemoteDataSource.removeTokenFromPrefs();
//                 Navigator.pushReplacementNamed(context, '/LoginScreen');
//               },
//               icon: const Icon(Icons.logout_rounded)),
//           IconButton(
//               onPressed: () async {
//                 String? token = await UserRemoteDataSource.getTokenFromPrefs();
//                 debugPrint(token);
//               },
//               icon: const Icon(Icons.key)),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SizedBox(
//             height: 600,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 3,
//                     childAspectRatio: 1,
//                     children: const [
//                       ProductCategory(
//                         title: 'Men\'s wear',
//                         image: 'assets/images/mans.jpg',
//                       ),
//                       ProductCategory(
//                         title: 'Womens wear',
//                         image: 'assets/images/women.png',
//                       ),
//                       ProductCategory(
//                         title: 'Kids wear',
//                         image: 'assets/images/kids.png',
//                       ),
//                       ProductCategory(
//                         title: 'Shoes',
//                         image: 'assets/images/shoes.png',
//                       ),
//                       ProductCategory(
//                         title: 'Trending',
//                         image: 'assets/images/clothes.png',
//                       ),
//                       ProductCategory(
//                         title: 'New Inn',
//                         image: 'assets/images/newin.png',
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   alignment: Alignment.center,
//                   child: const Text(
//                     '#TailorMADE',
//                     style:
//                         TextStyle(fontSize: 24, fontFamily: 'Montserrat Bold'),
//                   ),
//                 ),
//                 Row(
//                   children: const [
//                     Text(
//                       'Flash Sale',
//                       style: TextStyle(fontSize: 18),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: height * 0.3,
//                   child: ListView.builder(
//                       itemCount: _product_list.length,
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.all(10),
//                       itemBuilder: ((context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             debugPrint('$index');
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   width: 150,
//                                   height: 150,
//                                   margin: const EdgeInsets.only(right: 10),
//                                   // decoration:
//                                   //     const BoxDecoration(color: Colors.red),
//                                   child: Image.network(
//                                     '${_product_list[index]['image']}',
//                                     fit: BoxFit.cover,
//                                   )),
//                               Text('NPR ${_product_list[index]['price']}'),
//                               Text('NPR ${_product_list[index]['price'] + 200}',
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Color.fromARGB(255, 73, 73, 73),
//                                     decoration: TextDecoration.lineThrough,
//                                     decorationColor: Colors.red,
//                                     decorationStyle: TextDecorationStyle.solid,
//                                   )),
//                             ],
//                           ),
//                         );
//                       })),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
