import 'package:better_bingo/password_block/account_input.dart';
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
    return const Material(
      child: AccountInput(),
    );
  }
}
