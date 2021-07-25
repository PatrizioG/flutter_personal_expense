import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_personal_expense/widgets/chart.dart';
import 'package:flutter_personal_expense/widgets/new_transaction.dart';
import 'package:flutter_personal_expense/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  */
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
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
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
  bool _showChart = false;
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(
        'Personal expenses',
      ),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );

    var appBarHeight = appBar.preferredSize.height;
    var screenHeight = MediaQuery.of(context).size.height;
    var mobileBHeight = MediaQuery.of(context).padding.top;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var txWidget70Percent = Container(
      height: (screenHeight - appBarHeight - mobileBHeight) * 0.7,
      child: TransactionList(_transactions, _deleteTransaction),
    );

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: Icon(Icons.add)),
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (!isLandscape)
                ..._buildPortraitContent(
                    chartHeight:
                        (screenHeight - appBarHeight - mobileBHeight) * 0.3,
                    txListHeight:
                        (screenHeight - appBarHeight - mobileBHeight) * 0.7),
              if (isLandscape)
               ..._buildLandscapeContent(
                   chartHeight: (screenHeight - appBarHeight - mobileBHeight) * 0.7,
                   txListHeight: (screenHeight - appBarHeight - mobileBHeight) * 0.7)
            ],
          ),
        ));
  }

  List<Widget> _buildPortraitContent(
      {required double chartHeight, required double txListHeight}) {
    return [
      Container(
        height: chartHeight,
        child: Chart(_recentTransactions),
      ),
      _buildTxList(height: txListHeight)
    ];
  }

  List<Widget> _buildLandscapeContent( {required double chartHeight, required double txListHeight}) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Show chart'),
          Switch(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              })
        ],
      ),
      _showChart
          ? Container(
              height: chartHeight,
              child: Chart(_recentTransactions),
            )
          : _buildTxList(height: txListHeight),
    ];
  }

  Widget _buildTxList({required double height}) {
    return Container(
      height: height,
      child: TransactionList(_transactions, _deleteTransaction),
    );
  }

  void _addNewTransaction(String title, double amount, DateTime chosedDate) {
    print('inside _addNewTransaction');
    print(title);
    print(amount);

    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosedDate);

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
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
