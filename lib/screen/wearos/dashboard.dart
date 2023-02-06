import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WearDashboardScreen extends StatefulWidget {
  const WearDashboardScreen({super.key});

  static const String route = "wearDashboardScreen";

  @override
  State<WearDashboardScreen> createState() => _WearDashboardScreenState();
}

class _WearDashboardScreenState extends State<WearDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (
        context,
        mode,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * .2,
            title: const Text('Dashboard'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: const [
                  Text('Dashboard'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}