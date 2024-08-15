class TransactionModel {
  final String fromCard;
  final String toCard;
  final double amount;
  final DateTime date;

  TransactionModel({required this.fromCard, required this.toCard, required this.amount})
      : date = DateTime.now();
}
