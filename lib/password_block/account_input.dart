import 'package:better_bingo/password_block/input_field.dart';
import 'package:flutter/material.dart';

class AccountInput extends StatefulWidget {
  const AccountInput({super.key});

  @override
  State<StatefulWidget> createState() => AccountInputState();
}

class AccountInputState extends State<AccountInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/dark_background.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        const InputField(
          inputFields: ["Username", "Password", "Description"],
        ),
      ],
    );
  }
}
