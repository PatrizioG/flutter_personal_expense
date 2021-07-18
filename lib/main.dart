import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "Scarpe nuove", amount: 49.0, date: DateTime.now()),
    Transaction(id: "t2", title: "Spesa", amount: 35.75, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                color: Colors.blue,
                elevation: 5.0,
              ),
            ),
            Column(
              children: [
                ...transactions.map((tx) => Card(
                      child: Row(
                        children: [
                          Container(
                            child: Text(tx.amount.toString()),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            children: [
                              Text(tx.title),
                              Text(tx.date.toString())
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
