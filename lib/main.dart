import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/screens/spacex_launch_detail.dart';

void main() {
  runApp(SpaceX());
}

class SpaceX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SpaceXLaunchDetail(),
    );
  }
}
