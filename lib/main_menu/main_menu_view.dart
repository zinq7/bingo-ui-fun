import 'package:auto_size_text/auto_size_text.dart';
import 'package:better_bingo/server/client_from_code.dart';
import 'package:better_bingo/main_menu/bordered_button_icon.dart';
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
    var expandedLayout = size.width > 900;
    var rotatedMobile = !expandedLayout && size.width > size.height;

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
          Image.asset(
            'assets/ResLogo.webp',
            opacity: const AlwaysStoppedAnimation(0.4),
          ),
          Column(
            children: [
              SizedBox(
                height: expandedLayout || rotatedMobile
                    ? size.height / 2 - 100
                    : size.height / 2 - 200,
                child: Align(
                  alignment: false && expandedLayout
                      ? Alignment.topCenter
                      : Alignment.center,
                  child: AutoSizeText(
                    "RoRes BINGO",
                    minFontSize: 32,
                    wrapWords: false,
                    maxLines: 1,
                    style: buttonTextStyle.copyWith(
                      fontSize: 128.0,
                    ),
                  ),
                ),
              ),
              Flex(
                direction: (expandedLayout || rotatedMobile)
                    ? Axis.horizontal
                    : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // h0st button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/host");
                      },
                      child: BorderedButtonIcon(
                        "HOST",
                        width: rotatedMobile ? size.width / 3 : 400,
                        height: rotatedMobile ? 150 : 200,
                        borderWidth: 4,
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                  // client button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/client");
                      },
                      child: BorderedButtonIcon(
                        "CLIENT",
                        width: rotatedMobile ? size.width / 3 : 400,
                        height: rotatedMobile ? 150 : 200,
                        borderWidth: 4,
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ],
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
  fontSize: 96,
  fontFamily: "Bombardier",
  letterSpacing: 4,
  fontWeight: FontWeight.w300,
  shadows: [
    Shadow(
      offset: Offset(4, 4),
      color: Colors.black,
      blurRadius: 5,
    ),
  ],
);
