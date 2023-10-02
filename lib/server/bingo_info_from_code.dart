List getBingoFromCode(String code) {
  // TESTING ROUTE, WITHOUT COMMS
  if (true || code == "TEST") {
    List allBingo = [code];
    allBingo.addAll([
      "hey",
      "Longer sentence",
      "really fucking long sentece",
      "Player gets hit my a beetle queen and dies"
    ]);
    for (int i = allBingo.length; i < 30; i++) {
      allBingo.add(i.toString());
    }
    return allBingo;
  }

  // footer
  return [];
}
