import 'package:flutter/material.dart';

class InvalidPage extends StatelessWidget {
  final String nextNavigation;
  const InvalidPage({super.key, this.nextNavigation = "main"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
