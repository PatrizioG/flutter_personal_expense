import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_personal_expense/models/transaction.dart';
import 'package:flutter_personal_expense/widgets/transaction_item.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraint) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: constraint.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png'),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: _deleteTransaction,
                );
              }),
    );
  }
}
