import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_personal_expense/widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                color: Colors.blue,
                elevation: 5.0,
              ),
            ),
            UserTransactions()
          ],
        ));
  }
}
