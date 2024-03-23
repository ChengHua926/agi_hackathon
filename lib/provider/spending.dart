import 'package:flutter/material.dart';

import 'spending_model.dart'; // Import the Spending model




class SpendingListProvider with ChangeNotifier {
  List<Spending> _spendings = [];

  List<Spending> get spendings => _spendings;

  void addSpending(String category, double amount) {
    _spendings.add(Spending(category: category, amount: amount));
    notifyListeners(); // Notifies listeners about changes
  }
}
