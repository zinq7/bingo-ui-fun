import 'dart:math';
import 'dart:ui';

import 'package:better_bingo/client/bingo_board_overlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screenshot/screenshot.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'bingo_tile.dart';

class ClientView extends StatefulWidget {
  final int width = 5, height = 5;
  final String titleText = "Bingo!";

  final List allBingoTiles;

  const ClientView({super.key, required this.allBingoTiles});

  @override
  createState() => ClientViewState();
}

class ClientViewState extends State<ClientView> {
  late Uint8List _imageFile;
  int _points = 0;
  ScreenshotController bingoScreenshotter = ScreenshotController();

  String getTitle() {
    switch (widget.width) {
      case 5:
        return "Plus5";
      case 6:
        return "Plus5!";
      case 7:
        return "Eclipse";
      case 8:
        return "Eclipse8";
      default:
        return "BingoButAwesome".substring(0, widget.width);
    }
  }

  List<String> getBoard() {
    return List<String>.from(widget.allBingoTiles);
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

  double getFractionOfMin(BuildContext context, bool isWidth) {
    var siz = MediaQuery.of(context).size;
    var minimum = min(siz.width, siz.height);
    return minimum / (isWidth ? siz.width : siz.height);
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
              if (true) {
                print(bingoTiles[i]);
              }
            },
          ),
        ),
      );
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    var bingoJson = getBoard();
    var tiles = makeBoard(bingoJson);

    return Material(
      color: const Color.fromARGB(255, 33, 43, 50),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
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
            FractionallySizedBox(
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
                        getTitle(),
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
                                  tileNames: bingoJson,
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
                          IconButton(
                            onPressed: () {
                              bingoScreenshotter
                                  .capture()
                                  .then((Uint8List? image) {
                                if (image != null) {
                                  // first alert the user of the copy
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext contexto) {
                                        return AlertDialog(
                                          title: Text(
                                            "Copied Your Screenshot!",
                                            textAlign: TextAlign.center,
                                            style: bingoTextStyle.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 217, 243, 255),
                                            ),
                                          ),
                                          content: Image.memory(image),
                                          backgroundColor: Colors.black,
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  contexto, 'ok cool'),
                                              style: const ButtonStyle(
                                                  alignment:
                                                      Alignment.topCenter),
                                              child: Text(
                                                'ok cool',
                                                textAlign: TextAlign.center,
                                                style: bingoTextStyle.copyWith(
                                                  color: const Color.fromARGB(
                                                      255, 217, 243, 255),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });

                                  // save image state ig
                                  setState(() {
                                    _imageFile = image;

                                    final item = DataWriterItem();
                                    item.add(Formats.png(_imageFile));
                                    ClipboardWriter.instance.write([item]);
                                  });
                                }
                              });
                            },
                            color: const Color.fromARGB(155, 30, 30, 30),
                            icon: Text(
                              "PLEASE CLICK ME",
                              style: bingoTextStyle.copyWith(
                                fontSize: 24,
                                color: Colors.blue,
                              ),
                            ),
                            /*Image.network(
                              "https://files.softicons.com/download/toolbar-icons/mono-general-icons-2-by-custom-icon-design/png/512x512/copy.png",
                              color: Colors.white70,
                            ),*/
                          ),
                          Text(
                            "Estimated $_points pts",
                            style: bingoTextStyle.copyWith(fontSize: 24),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
