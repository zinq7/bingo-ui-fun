List getBingoFromCode(String code) {
  // TESTING ROUTE, WITHOUT COMMS
  if (code == "TEST") {
    List allBingo = [];
    for (int i = 0; i < 30; i++) {
      allBingo.add(i.toString());
    }
    return allBingo;
  }

  // footer
  return [];
}
