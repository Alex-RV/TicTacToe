import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);
 
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard>{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("X"),
        ),
      ],
    );
  }
}