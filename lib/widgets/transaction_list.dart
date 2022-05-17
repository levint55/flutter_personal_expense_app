import 'package:flutter/material.dart';
import 'package:flutter_personal_expense_app/models/transaction.dart';
import 'package:flutter_personal_expense_app/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  const TransactionList(this.transactions, this._deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'Empty',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(
                  key: ValueKey(transactions[index].id),
                  transactions: transactions[index],
                  mediaQuery: mediaQuery,
                  deleteTransaction: _deleteTransaction,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
