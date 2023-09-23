import 'package:better_bingo/client/client_view.dart';
import 'package:flutter/material.dart';

//import 'main_menu.dart';
//import 'client/bingo_tile.dart';

void main() {
  List allBingo = [];
  for (int i = 0; i < 30; i++) {
    allBingo.add(i.toString());
  }

  allBingo = [
    "Horde of Many",
    "Void seed in TP",
    "10+ Shungite",
    "Red Printer",
    "Neavako wins a loadout",
    "Mending Elder Lemurian",
    "Mithrix p1 +5",
    "Mithrix p4 +5",
    "Shungite bullet hell tp",
    "Worldspawn Xi",
    "4+ Boss Mobs alive",
    "Blind Soup",
    "Drone Build",
    "1 shot tp event boss",
    "50+% crit",
    "Sawtech (anywhere)",
    "Vritting a big boi (parent sized or bigger)",
    "Staying pure (a run with 0 void items)",
    "Spaces Bug",
    "idk something to do with Meadow being a donut and maybe tp location",
    "Boss printer",
    "SOUL pillar",
    "MASS pillar",
    "Hits a newt alter (and then enters the bazaar)",
    "Enemies H0sting (but not lunar golems, those guys too dumb)",
    "Underdog (Least voted gamba wings)",
    "Bling Effect (the 'best looking' voted skin wins the loadout)",
    "8+ min stage 1 (excluding deaths)",
    "Cursed (more than 60% of hp bar is curse (150+ curse stacks))",
    "Although the loader... (shustice pickup on anyone)",
    "Enemy Death Marked",
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
