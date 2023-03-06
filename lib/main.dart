import 'package:flutter/material.dart';

//  ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 34, 138)),
void main() => runApp(MyApp());
// MaterialApp(
//       home: Scaffold(
//     appBar: AppBar(
//       title: Text('Some title'),
//       centerTitle: true,
//       backgroundColor: Color.fromARGB(255, 16, 34, 138),
//     ),
//     body: Center(
//       child: Text('data'),
//     ),
//     floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Text(
//         'button',
//         style: TextStyle(
//           color: Color.fromARGB(255, 93, 12, 34),
//         ),
//         ),
//         ),
//   ))
//   );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/tictactoe_o.png'),
              Image.asset('assets/tictactoe_o.png'),
              Image.asset('assets/tictactoe_o.png'),
            ],
          ),
        ),
      ),
    );
  }
}
