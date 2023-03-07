class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardLenth = 9;
  static final double blockSize = 100; //requered type of double or 100.0
  //!!!Check what a difference between final and const

  //Empty board
  List<String>? board;
  
  static List<String>? initGameBoard() =>
      List.generate(boardLenth, (index) => Player.empty);
}
