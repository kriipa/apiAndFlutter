// @dart= 2.9
import 'package:furniturezoid/state/objectbox_state.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app.dart';

import '../helper/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    final prefs=await SharedPreferences.getInstance();


  // create an object for ObjectBoxInstance

  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();

  runApp(
    const MyApp(
      debugShowCheckedModeBanner: false,
    ),
  );
}
