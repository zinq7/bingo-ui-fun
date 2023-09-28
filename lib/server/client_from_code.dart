List getBingoFromCode(String code) {
  // TESTING ROUTE, WITHOUT COMMS
  if (code == "TEST") {
    List allBingo = [];
    allBingo.addAll([
      "hey",
      "Longer sentence",
      "really fucking long sentece",
      "Player gets hit my a beetle queen and dies"
    ]);
    for (int i = 0; i < 30; i++) {
      allBingo.add(i.toString());
    }
    return allBingo;
  }

  // footer
  return [];
}
