List getBingoFromCode(String code) {
  List allBingo = [code];

  // TESTING ROUTE, WITHOUT COMMS
  if (code == "TEST") {
    allBingo.addAll([
      "Bing",
      "Go",
      "Brrr",
      "bop",
      "boggers, my favourite word",
      "Brass",
      "bringing",
      "Binging"
    ]);
  } else if (code == "CODE") {
    allBingo.addAll([
      "What",
      "Wombat",
      "Who said What",
      "Why can't i type",
      "Semicolon",
    ]);
  }

  for (int i = allBingo.length; i < 30; i++) {
    allBingo.add(i.toString());
  }

  // footer
  return allBingo;
}
