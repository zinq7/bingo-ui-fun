import 'dart:ui';
import 'package:better_bingo/server/bingo_info_from_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:better_bingo/client/bingo_card.dart';

class ClientView extends StatefulWidget {
  final String code;

  const ClientView({super.key, required this.code});

  @override
  createState() => ClientViewState();
}

class ClientViewState extends State<ClientView> {
  late final List _tiles;

  List<String> getBoard() {
    _tiles = getBingoFromCode(widget.code);

    return List<String>.from(_tiles);
  }

  @override
  Widget build(BuildContext context) {
    var bingoJson = getBoard();

    return Material(
      color: const Color.fromARGB(255, 33, 43, 50),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/very_dark_background.jpg",
              fit: BoxFit.fill,
              width: 5000,
              height: 5000,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
            ClipRRect(
              // Clip it cleanly.
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  alignment: Alignment.center,
                ),
              ),
            ),
            BingoCard(bingoJson: bingoJson),
          ],
        ),
      ),
    );
  }
}

class TopTitleSingleChild extends SingleChildLayoutDelegate {
  final int itemsHashCode;
  final double paddingHeightFraction;
  TopTitleSingleChild(
      {required this.itemsHashCode, this.paddingHeightFraction = 0.0});

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(
      (size.width - childSize.width) / 2,
      size.height * paddingHeightFraction,
    );
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
