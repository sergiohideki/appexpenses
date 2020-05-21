import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  final espacoEntreComponente = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  espacoEntreComponente,
                  Text(
                    'Não possui nenhuma transação cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  espacoEntreComponente,
                  Container(
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
            itemCount: transactions.length, // quantidade de itens
            itemBuilder: (ctx, index) {
              // lazy loading
              final transaction = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(transaction),
                transaction: transaction,
                onRemove: onRemove,
              );
            },
          );
    // : ListView(
    //     children: transactions.map((transaction) {
    //       return TransactionItem(
    //         key: ValueKey(transaction.id),
    //         transaction: transaction,
    //         onRemove: onRemove,
    //       );
    //     }).toList(),
    //   );
  }
}
