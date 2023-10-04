import 'package:auto_size_text/auto_size_text.dart';

import 'package:better_bingo/main_menu/bordered_button_icon.dart';
import 'package:flutter/material.dart';

class MainMenuView extends StatelessWidget {
  final Function(String) callback;
  const MainMenuView({super.key, required this.callback});

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
                  // text field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 25),
                    child: SizedBox(
                      width: 400,
                      height: 300,
                      child: TextField(
                        onChanged: callback,
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
