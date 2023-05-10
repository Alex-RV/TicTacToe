import 'package:flutter/material.dart';
import 'package:tictactoe/game_logic.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

// ##TODO: add line when player winning the game

class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0; // to check the draw
  String result = "";

  Game game = Game();

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.shortestSide * 0.9;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      boardWidth = MediaQuery.of(context).size.shortestSide * 0.7;
    }
    //tell about difference between double and int
    //check what is the MediaQuery(look on documentation)
    // double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 2, 77),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "It's ".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 58,
                      ),
                    ),
                    TextSpan(
                        text: lastValue.toUpperCase(),
                        style: TextStyle(
                          color: lastValue == "X" ? Colors.blue : Colors.red,
                          fontSize: 58,
                        )),
                    TextSpan(
                        text: " turn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 58,
                        )),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              //check what is the crossAxisCount
              // ~/ return Int as result
              crossAxisCount: 3,

              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,

              //check how works "generate" in documentation
              children: List.generate(Game.boardLength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board[index] == "") {
                            setState(() {
                              print(game.board[index]);
                              game.board[index] = lastValue;
                              turn++;
                              gameOver = game.winnerCheck(lastValue, index);

                              if (gameOver) {
                                result = "$lastValue is the Winner";
                              } else if (!gameOver && turn == 9) {
                                result = "It's a Draw!";
                                gameOver = true;
                              }
                              if (lastValue == "X") {
                                lastValue = "O";
                              } else {
                                lastValue = "X";
                              }
                            });
                          }
                        },
                  child: Container(
                    width: Game.blockSize,
                    height: Game.blockSize,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 1, 37, 169),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(

                      // VERSION WITH IMAGES
                      child: game.board[index] == "" ? Text(
                        game.board[index],
                        style: TextStyle(
                            color: game.board[index] == "X"
                                ? Colors.blue
                                : Colors.red,
                            fontSize: 64.0),
                      ) : game.board[index] == "X" ? Image.asset('assets/images/cross.png') : Image.asset('assets/images/circle.png')

                      // VERSION WITH LETTERS

                      // child: Text(
                      //   game.board[index],
                      //   style: TextStyle(
                      //       color: game.board[index] == "X"
                      //           ? Colors.blue
                      //           : Colors.red,
                      //       fontSize: 64.0),
                      // ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Text(
            (gameOver) ? result : "",
            style: TextStyle(color: Colors.white, fontSize: 50.0),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                game.resetBoard();
                lastValue = "X";
                gameOver = false;
                turn = 0;
                result = "";
              });
            },
            icon: Icon(Icons.replay),
            label: Text("Repeat game"),
          ),
        ],
      ),
    );
  }
}
