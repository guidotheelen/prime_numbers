import 'package:flutter/material.dart';

import 'package:prime_numbers/prime_numbers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Numbers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Prime Numbers Demo Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 10000,
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87,
                width: 0.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$index',
                  style: TextStyle(
                    color: redIfTrue(index.isPrime),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                titleText('Factor count', index.factorCount().toString()),
                titleText('Almost prime', index.isKPrime(2).toString()),
                titleText('Prime gap', index.primeGap().toString()),
              ],
            ),
          );
        },
      ),
    );
  }

  Column titleText(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
      ],
    );
  }

  Color redIfTrue(bool value) => value ? Colors.red : Colors.black87;
}
