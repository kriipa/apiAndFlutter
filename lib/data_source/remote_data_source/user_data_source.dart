import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furniturezoid/app/constant.dart';
import 'package:furniturezoid/data_source/remote_data_source/response/login_response.dart';
import 'package:furniturezoid/model/user.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:furniturezoid/helper/http_service.dart';

class UserRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<int> addUser(File? file, User user) async {
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType('image', mimeType!.split("/")[1]),
        );
      }
      FormData formData = FormData.fromMap({
        'fname': user.fname,
        'lname': user.lname,
        'gender': user.gender,
        'password': user.password,
        'passwordConfirmation': user.passwordConfirmation,
        'email': user.email,
        'image': image,
      });

      Response response = await _httpServices.post(
        Constant.usersRegisterURL,
        data: formData,
      );
      if (response.statusCode == 201) {
        // registered success
        return 200;
      } else {
        //  Internal server error
        return 0;
      }
    } catch (e) {
      // if (e is DioError) {
      //   debugPrint(e.toString());
      //   int statusCode = e.response!.statusCode!;
      //   debugPrint('StatusCODE: $statusCode');
      //   return statusCode;
      // }
      return 0;
    }
  }

  Future<int> loginUser(String email, String password) async {
    try {
      Response response =
          await _httpServices.post(Constant.usersLoginURL, data: {
        "email": email,
        "password": password,
      });

      LoginResponse loginResponse = LoginResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        var token = loginResponse.token;
        UserRemoteDataSource.storeTokenInPrefs(token!);
        debugPrint(token);
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  static Future<void> storeTokenInPrefs(String token) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<String?> getTokenFromPrefs() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // debugPrint('tokenInPrefs:${prefs.getString('token')}');
      return prefs.getString('token');
    } catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }

  static Future<void> removeTokenFromPrefs() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      debugPrint('token Removed');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}


// class UserRemoteDataSource {
//   final Dio _httpServices = HttpServices().getDioInstance();

//   Future<int> addUser(String fname, String lname, String email, String password) async {
//     try {
//       Response response = await _httpServices.post(
//         Constant.usersRegisterURL,
//         data: {
//           "email": email,
//           "password": password,
//         },
//       );

//       if (response.statusCode == 200) {
//         // registered success
//         return 200;
//       } else {
//         //  Internal server error
//         return 0;
//       }
//     } catch (e) {
//       if (e is DioError) {
//         debugPrint(e.toString());
//         int statusCode = e.response!.statusCode!;
//         debugPrint('StatusCODE: $statusCode');
//         return statusCode;
//       }
//       return 0;
//     }
//   }

//   Future<int> loginUser(String email, String password) async {
//     try {
//       Response response =
//           await _httpServices.post(Constant.usersLoginURL, data: {
//         "email": email,
//         "password": password,
//       });

//       LoginResponse loginResponse = LoginResponse.fromJson(response.data);

//       if (response.statusCode == 200) {
//         var token = loginResponse.token;
//         UserRemoteDataSource.storeTokenInPrefs(token!);
//         debugPrint(token);
//         return 1;
//       } else {
//         return 0;
//       }
//     } catch (e) {
//       return 0;
//     }
//   }

//   static Future<void> storeTokenInPrefs(String token) async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', token);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   static Future<String?> getTokenFromPrefs() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       // debugPrint('tokenInPrefs:${prefs.getString('token')}');
//       return prefs.getString('token');
//     } catch (e) {
//       debugPrint(e.toString());
//       return e.toString();
//     }
//   }

//   static Future<void> removeTokenFromPrefs() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.remove('token');
//       debugPrint('token Removed');
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }