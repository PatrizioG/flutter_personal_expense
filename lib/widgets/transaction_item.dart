import 'package:flutter/material.dart';
import 'package:flutter_personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {

  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                    '€ ${transaction.amount.toString()}'),
              ),
            )),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.headline6
          //TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () =>
              deleteTransaction(transaction.id),
        ),
      ),
    );
  }
}
