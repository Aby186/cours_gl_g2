enum TType {
  envoi,
  retrait,
  depot,
  paiement,
  reception,
}

class Transaction {

  String title;
  double amount;
  DateTime date;
  TType type;

  Transaction({

    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });

  static List<Transaction> transactionList = [
  Transaction(

  title: 'Mamadou',
  amount: 6000,
  date: DateTime.now(),
  type: TType.envoi,
  ),

    Transaction(

      title: 'Saly',
      amount: 90000,
      date: DateTime.now(),
      type: TType.reception,
    ),
    Transaction(
      title: 'Canal+',
      amount: 5000,
      date: DateTime.now(),
      type: TType.paiement,
    ),
    Transaction(

      title: 'Depot',
      amount: 80000,
      date: DateTime.now(),
      type: TType.depot,
    ),
    Transaction(

      title: 'Retrait',
      amount: 5000,
      date: DateTime.now(),
      type: TType.retrait,
    ),
  ];


}


