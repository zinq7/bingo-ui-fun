import 'package:better_bingo/server/client_from_code.dart';
import 'package:better_bingo/ui/bordered_button_icon.dart';
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/background.jpg",
            fit: BoxFit.fill,
            scale: .50,
          ),
          Flex(
            direction: (size.width > 600) ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // h0st button
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/host");
                },
                child: const BorderedButtonIcon(
                  "HOST",
                  width: 400,
                  height: 300,
                  borderWidth: 4,
                  style: buttonTextStyle,
                ),
              ),

              // client button
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/client");
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/BoxExample.png"),
                    const Text(
                      "Client",
                      style: buttonTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
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

const buttonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 128,
  fontFamily: "Bombardier",
  shadows: [
    Shadow(offset: Offset(1, 1), color: Colors.black),
  ],
);
