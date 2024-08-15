import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/card.dart';
import '../../repos/app_state.dart';

class TransactionScreen extends StatefulWidget {
  final CardModel card;

  const TransactionScreen({super.key, required this.card});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  CardModel? selectedToCard;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
                'From: ${widget.card.cardHolderName} (${widget.card.cardNumber})'),
            DropdownButton<CardModel>(
              hint: const Text('Select card to transfer to'),
              value: selectedToCard,
              onChanged: (CardModel? newValue) {
                setState(() {
                  selectedToCard = newValue;
                });
              },
              items: appState.cards
                  .where((card) => card != widget.card)
                  .map<DropdownMenuItem<CardModel>>((CardModel card) {
                return DropdownMenuItem<CardModel>(
                  value: card,
                  child: Text('${card.cardHolderName} (${card.cardNumber})'),
                );
              }).toList(),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double amount = double.parse(amountController.text);
                if (selectedToCard != null && amount > 0) {
                  appState.performTransaction(
                      widget.card, selectedToCard!, amount);
                  Navigator.pop(context);
                } else {
                  // Handle error
                }
              },
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
