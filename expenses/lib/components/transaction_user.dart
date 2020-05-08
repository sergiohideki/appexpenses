import 'dart:math';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 250.80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #01',
      value: 250.80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #02',
      value: 250.80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #03',
      value: 250.80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #04',
      value: 250.80,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
