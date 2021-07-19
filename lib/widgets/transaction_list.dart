import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((tx) => Card(
          child: Row(
            children: [
              Container(
                child: Text(
                  '€ ${tx.amount.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    border:
                    Border.all(width: 2, color: Colors.purple)),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    //DateFormat.yMMMMd("it_IT").format(tx.date),
                    DateFormat.yMMMMd().format(tx.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
