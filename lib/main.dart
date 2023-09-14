import 'package:better_bingo/client/client_view.dart';
import 'package:flutter/material.dart';

//import 'main_menu.dart';
//import 'client/bingo_tile.dart';

void main() {
  List allBingo = [];
  for (int i = 0; i < 30; i++) {
    allBingo.add(i.toString());
  }
  runApp(
    MaterialApp(
      home: ClientView(
        allBingoTiles: allBingo,
      ),
    ),
  );
}
