import 'dart:io';

import 'package:furniturezoid/data_source/local_data_source/user_data_source.dart';
import 'package:furniturezoid/data_source/remote_data_source/user_data_source.dart';

import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> addUser(File? file, User user);
  Future<int> loginUser(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(File? file, User user) {
    return UserRemoteDataSource().addUser(file, user);
  }

  @override
  Future<List<User>> getAllUser() {
    return UserDataSource().getAllUser();
  }

  @override
  Future<int> loginUser(String email, String password) {
    return UserRemoteDataSource().loginUser(email, password);
  }
}
