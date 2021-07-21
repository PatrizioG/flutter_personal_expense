import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
        children: [
          Text('No transactions added yet!', 
          style: Theme.of(context).textTheme.headline6,),
          SizedBox(height:10),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png'),
          ),
        ],        
      )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '€ ${transactions[index].amount.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.headline6
                              //TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                          Text(
                            //DateFormat.yMMMMd("it_IT").format(tx.date),
                            DateFormat.yMMMMd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
