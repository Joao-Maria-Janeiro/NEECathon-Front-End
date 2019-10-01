class Transaction{
  final int id;
  String destTeam, description;
  double amount;
  Transaction(this.id, this.destTeam, this.amount, this.description);
  String toString() => '$id:  => $destTeam  |  value = $amount';
  Map toJson() => {'id': id, 'destTeam': destTeam, 'value': amount, 'description': description};
}
