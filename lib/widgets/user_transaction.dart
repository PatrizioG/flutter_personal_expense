import 'package:flutter/material.dart';
import 'package:flutter_personal_expense/models/transaction.dart';
import 'package:flutter_personal_expense/widgets/new_transaction.dart';
import 'package:flutter_personal_expense/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _transactions = [
    Transaction(
        id: "t1", title: "Scarpe nuove", amount: 49.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Spesa", amount: 35.75, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {

    print ('inside _addNewTransaction');
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}
