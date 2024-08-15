import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/transaction.dart';

class AppState extends ChangeNotifier {
  List<CardModel> cards = [
    CardModel(cardNumber: '1234 5678 9012 3456', cardHolderName: 'John Doe', balance: 1000.00),
    CardModel(cardNumber: '9876 5432 1098 7654', cardHolderName: 'Jane Smith', balance: 500.00),
  ];

  List<TransactionModel> transactions = [];

  void performTransaction(CardModel fromCard, CardModel toCard, double amount) {
    if (fromCard.balance >= amount) {
      fromCard.balance -= amount;
      toCard.balance += amount;
      transactions.add(TransactionModel(fromCard: fromCard.cardNumber, toCard: toCard.cardNumber, amount: amount));
      notifyListeners();
    } else {
      // Handle insufficient balance
      print('Insufficient balance');
    }
  }
}
