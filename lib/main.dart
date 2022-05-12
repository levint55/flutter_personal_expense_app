import 'package:flutter/material.dart';
import 'package:flutter_personal_expense_app/models/transaction.dart';
import 'package:flutter_personal_expense_app/widgets/new_transaction.dart';
import 'package:flutter_personal_expense_app/widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '0',
      title: 'Title1',
      amount: 10.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1',
      title: 'Title2',
      amount: 29.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Title3',
      amount: 32.00,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => {_showModal(context)},
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text('Personal Expense'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Card(
            child: Container(
              child: const Text(
                'Card',
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColorDark,
            ),
            elevation: 10,
          ),
          TransactionList(_transactions),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {_showModal(context)},
      ),
    );
  }
}
