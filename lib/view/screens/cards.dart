import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repos/app_state.dart';
import 'history.dart';
import 'transactions.dart';

class CardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cards'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransactionHistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: appState.cards.length,
        itemBuilder: (context, index) {
          final card = appState.cards[index];
          return Card(
            child: ListTile(
              title: Text(card.cardHolderName),
              subtitle: Text(card.cardNumber),
              trailing: Text('\$${card.balance.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionScreen(card: card),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
