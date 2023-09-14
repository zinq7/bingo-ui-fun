import 'package:better_bingo/client/client_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//import 'main_menu.dart';
//import 'client/bingo_tile.dart';

void main() {
  List allBingo = [
    "kei is bad",
    "kei isn't good",
    "kei loses",
    "kei dies",
    "kei doesn't win",
    "kei throws",
    "kei trolls",
    "kei goes to japan",
    "kei fails japan tests",
    "kei speaks japanese",
    "kei doesn't speak",
    "kei complains about loader (free square)",
    "kei goes slow (as always)",
    "zinq wins",
    "kei decides to die 10 times",
    "bad loadout",
    "h0sting",
    "kei h0sting",
    "kei deletes the game",
    "technical difficulties (with kei)",
    "cabbage wins",
    "cabbage loses",
    "cabbage doesn't win",
    "bingo",
    "plus5"
  ];
  runApp(
    MaterialApp(
      home: ClientView(
        allBingoTiles: allBingo,
      ),
    ),
  );
}
