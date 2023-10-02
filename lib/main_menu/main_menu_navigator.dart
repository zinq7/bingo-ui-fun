import 'package:flutter/material.dart';
import 'package:better_bingo/client/client_view.dart';
import 'package:better_bingo/host/host_view.dart';
import 'package:better_bingo/main_menu/main_menu_view.dart';

class MainMenu extends StatefulWidget {
  final String code;
  const MainMenu({super.key, required this.code});

  @override
  State<StatefulWidget> createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  String _code = "null";
  MainMenuState();

  @override
  Widget build(BuildContext context) {
    print("building main menu navigator");
    if (_code == "null") {
      setState(() => _code = widget.code);
    } else {
      setState(() => _code = "${_code}h");
    }

    return MaterialApp(
      initialRoute: "/main",
      routes: {
        "/main": (BuildContext context) => const MainMenuView(),
        "/client": (BuildContext context) => ClientView(
              // this'll be a main menu soon(tm)
              code: _code,
            ),
        "/host": (BuildContext context) => HostView(
              button: TextButton(
                child: const Text("Go to Client View"),
                onPressed: () {
                  Navigator.pushNamed(context, "/client");
                },
              ),
            ),
      },
    );
  }
}
