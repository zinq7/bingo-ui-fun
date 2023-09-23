import 'dart:typed_data';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:screenshot/screenshot.dart';

import 'package:better_bingo/client/bingo_board_overlayer.dart';
import 'package:better_bingo/client/bingo_tile.dart';

class BingoCard extends StatefulWidget {
  final int width = 5, height = 5;
  final String titleText = "Bingo!";

  final List<String> bingoJson;
  const BingoCard({super.key, required this.bingoJson});

  @override
  State<StatefulWidget> createState() => BingoCardState();
}

// STATE
class BingoCardState extends State<BingoCard> {
  ScreenshotController bingoScreenshotter = ScreenshotController();

  double getFractionOfMin(BuildContext context, bool isWidth) {
    var siz = MediaQuery.of(context).size;
    var minimum = min(siz.width, siz.height);
    return minimum / (isWidth ? siz.width : siz.height);
  }

  TextStyle getBingoTitleStyle(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    var minimum = min(siz.width, siz.height);

    double fontSize = max(minimum / 40, 12);
    double coeff = (minimum - 2 * fontSize) / minimum;

    return bingoTextStyle.copyWith(
      letterSpacing: (minimum - (8 * fontSize)) * coeff / 5,
      fontSize: fontSize,
    );
  }

  List<Widget> makeBoard(List<String> bingoTiles) {
    List<Widget> tiles = [];

    for (int i = 0; i < widget.width * widget.height; i++) {
      tiles.add(
        LayoutId(
          id: bingoTiles[i].hashCode,
          child: BingoTile(
            text: bingoTiles[i],
            onClickCallback: (BingoTileState self) {
              // don't do anything rn
            },
          ),
        ),
      );
    }

    return tiles;
  }

  void displayScreenshot(Uint8List? image) {
    if (image == null) return;

    // first alert the user of the copy
    showDialog(
      context: context,
      builder: (BuildContext contexto) {
        return AlertDialog(
          title: Text(
            "Copied Your Screenshot!",
            textAlign: TextAlign.center,
            style: bingoTextStyle.copyWith(
              color: const Color.fromARGB(255, 217, 243, 255),
            ),
          ),
          content: Image.memory(image),
          backgroundColor: Colors.black,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(contexto, 'ok cool'),
              style: const ButtonStyle(alignment: Alignment.topCenter),
              child: Text(
                'ok cool',
                textAlign: TextAlign.center,
                style: bingoTextStyle.copyWith(
                  color: const Color.fromARGB(255, 217, 243, 255),
                ),
              ),
            ),
          ],
        );
      },
    );

    // save image state ig

    final item = DataWriterItem();
    item.add(Formats.png(image));
    ClipboardWriter.instance.write([item]);
  }

  @override
  Widget build(BuildContext context) {
    var tiles = makeBoard(widget.bingoJson);

    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: getFractionOfMin(context, true),
      heightFactor: getFractionOfMin(context, false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: const Color.fromARGB(200, 33, 43, 50),
          ),
          Column(
            children: [
              Text(
                "Plus5",
                textScaleFactor: 2,
                // textAlign: TextAlign.center,
                style: getBingoTitleStyle(context),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Screenshot(
                  controller: bingoScreenshotter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/ResLogo.webp',
                        opacity: const AlwaysStoppedAnimation(0.2),
                      ),
                      CustomMultiChildLayout(
                        delegate: TileBoardDelegate(
                          boardHeight: widget.height.toDouble(),
                          boardWidth: widget.width.toDouble(),
                          tileNames: widget.bingoJson,
                        ),
                        children: tiles, // the tiles
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      bingoScreenshotter.capture().then(displayScreenshot);
                    },
                    child: Text(
                      "Click to Share (sometimes)",
                      style: bingoTextStyle.copyWith(
                        fontSize: getBingoTitleStyle(context).fontSize!,
                        shadows: [
                          const Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 0.5),
                        ],
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    "DON'T LEAVE THIS TAB",
                    style: bingoTextStyle.copyWith(
                      fontSize: getBingoTitleStyle(context).fontSize!,
                      shadows: [
                        const Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 0.5),
                      ],
                      color: Colors.red,
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
