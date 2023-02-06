// @dart=2.9
import 'package:furniturezoid/state/objectbox_state.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app.dart';
import '../helper/objectbox.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // create an object for ObjectBoxInstance

  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();

  AwesomeNotifications().initialize(
    'resource://drawable/launcher',
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color.fromARGB(255, 148, 124, 90),
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true,
      ),
    ],
  );

  runApp(
    const MyApp(
      debugShowCheckedModeBanner: false, 
    ),
  );
}
