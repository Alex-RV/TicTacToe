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

  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    //first let's declare the row   and col
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    print('Score ${score}');
    scoreboard[row] += score;
    print('ScoreBoard row ${scoreboard[row]}');
    scoreboard[gridSize + col] += score;
    if (row == col) scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;

    //checking if we have 3 or -3 in the score board
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    ;

    //by default it will return false
    return false;
  }
}

// class Player {
//   static const x = "X";
//   static const o = "O";
//   static const empty = "";
// }

// class Game {
//   static final boardLength = 9;
//   static final double blockSize = 100.0;

//   //Empty board
//   List<String> board;

//   Game() {
//     board = initGameBoard();
//   }

//   static List<String> initGameBoard() =>
//       List.generate(boardLength, (index) => Player.empty);

//   bool winnerCheck(String player) {
//     // Define the winning patterns
//     final patterns = [
//       [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
//       [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
//       [0, 4, 8], [2, 4, 6] // Diagonals
//     ];

//     // Check if any of the winning patterns is satisfied by the player's moves
//     for (final pattern in patterns) {
//       if (pattern.every((index) => board[index] == player)) {
//         return true;
//       }
//     }

//     return false;
//   }

//   bool isBoardFull() {
//     return board.every((cell) => cell != Player.empty);
//   }

//   bool makeMove(String player, int index) {
//     if (board[index] == Player.empty) {
//       board[index] = player;
//       return true;
//     }

//     return false;
//   }

//   void resetBoard() {
//     board = initGameBoard();
//   }
// }
