import 'package:better_bingo/server/client_from_code.dart';
import 'package:flutter/material.dart';
import 'package:better_bingo/client/client_view.dart';
import 'package:better_bingo/host/host_view.dart';

class MainMenu extends StatefulWidget {
  final String code;
  const MainMenu({super.key, required this.code});

  @override
  State<StatefulWidget> createState() => MainMenuState();
}

class RealMainMenu extends StatelessWidget {
  const RealMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/background.jpg"),
        ],
      ),
    );
  }
}

class MainMenuState extends State<MainMenu> {
  late List _tiles;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _tiles = getBingoFromCode("TEST");
    });

    return MaterialApp(
      initialRoute: "/main",
      routes: {
        "/main": (BuildContext context) => const RealMainMenu(),
        "/client": (BuildContext context) => ClientView(
              // this'll be a main menu soon(tm)
              allBingoTiles: _tiles,
            ),
        "/host": (BuildContext context) => HostView(
              button: TextButton(
                child: Text("Go to Client View"),
                onPressed: () {
                  Navigator.pushNamed(context, "/client");
                },
              ),
            ),
      },
    );
  }
}
