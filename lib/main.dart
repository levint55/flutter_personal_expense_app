import 'package:flutter/material.dart';
import 'package:flutter_personal_expense_app/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Title',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(children: <Widget>[
          Card(
            child: Container(
              child: const Text(
                'Card',
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            elevation: 10,
          ),
          Column(
              children: transactions.map((e) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      e.amount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        e.date.toString(),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            );
          }).toList())
        ]),
      ),
    );
  }
}
