import 'dart:math';

import 'package:flutter/material.dart';

class TileBoardDelegate extends MultiChildLayoutDelegate {
  final List<String> tileNames;
  final double boardWidth, boardHeight;
  double topFraction, leftFraction;

  TileBoardDelegate({required this.tileNames, required this.boardWidth, required this.boardHeight, this.topFraction = 0.2, this.leftFraction = 0.2});

  @override
  void performLayout(Size size) {
    // some math to find the square we want to place the items
    var width = min(size.width, size.height) * (boardWidth / boardHeight), height = min(size.width, size.height) * (boardHeight / boardWidth);
    var xOffset = (size.width - width) / 2, yOffset = (size.height - height) / 2;

    int counter = 0;
    for (var tile in tileNames) {
      if (counter >= boardHeight * boardWidth) break;

      // layout child
      var minRatio = (boardHeight < boardWidth ? height / boardHeight : width / boardWidth) - 4;
      layoutChild(
        tile.hashCode,
        BoxConstraints(
          minWidth: 32,
          maxWidth: minRatio,
          minHeight: 32,
          maxHeight: minRatio,
        ),
      );

      positionChild(
        tile.hashCode,
        Offset(
          width * ((counter % boardWidth) / boardWidth) + xOffset,
          height * ((counter ~/ boardHeight) / boardHeight) + yOffset,
        ),
      );

      counter++; // efficient
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
