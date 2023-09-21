import 'package:flutter/material.dart';

class HostView extends StatefulWidget {
  final Widget button;
  const HostView({super.key, required this.button});

  @override
  State createState() => HostViewState();
}

class HostViewState extends State<HostView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/dark_background.jpg"),
        widget.button,
      ],
    );
  }
}
