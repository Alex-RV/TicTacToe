import 'package:flutter/material.dart';
//  ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 34, 138)),
void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Some title'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 16, 34, 138),
      ),
      body: Center(
        child: Text('data'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text(
          'button',
          style: TextStyle(
            color: Color.fromARGB(255, 93, 12, 34),
          ),
          ),
          ),
    )));
