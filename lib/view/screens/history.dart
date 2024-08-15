import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repos/app_state.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: appState.transactions.length,
        itemBuilder: (context, index) {
          final transaction = appState.transactions[index];
          return ListTile(
            title: Text('${transaction.fromCard} -> ${transaction.toCard}'),
            subtitle: Text('Amount: \$${transaction.amount.toStringAsFixed(2)}'),
            trailing: Text('${transaction.date}'),
          );
        },
      ),
    );
  }
}
