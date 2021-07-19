import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (val) => titleInput = val,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (val) => amountInput = val,
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                var amount = double.parse(amountController.text);
                _addNewTransaction(titleController.text, amount);
              },
              child: Text('Add Transaction'),
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all(Colors.purple)),
            )
          ],
        ),
      ),
    );
  }
}
