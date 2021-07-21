import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_personal_expense/widgets/new_transaction.dart';
import 'package:flutter_personal_expense/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "t1", title: "Scarpe nuove", amount: 49.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Spesa", amount: 35.75, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text('Personal expenses'),
          actions: [
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                color: Theme.of(context).primaryColor,
                elevation: 5.0,
              ),
            ),
            TransactionList(_transactions)
          ],
        ));
  }

  void _addNewTransaction(String title, double amount) {
    print('inside _addNewTransaction');
    print(title);
    print(amount);

    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }
}
