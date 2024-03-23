import 'package:flutter/material.dart';
import 'spending_model.dart'; // Import the Spending model

class SpendingListProvider with ChangeNotifier {
  // Predefined list of spendings and earnings
  // ignore: prefer_final_fields
  List<Spending> _spendings = [
    Spending(category: '餐饮', amount: 120.0, isExpense: true),
    Spending(category: '社交', amount: 200.0, isExpense: true),
    Spending(category: '工资', amount: 3500.0, isExpense: false),
    Spending(category: '购物', amount: 450.0, isExpense: true),
    Spending(category: '礼金', amount: 500.0, isExpense: false),
    Spending(category: '出行', amount: 30.0, isExpense: true),
    Spending(category: '其他', amount: 150.0, isExpense: true),
    Spending(category: '理财', amount: 400.0, isExpense: false),
    Spending(category: '其他', amount: 300.0, isExpense: false),
  ];

  List<Spending> get spendings => _spendings;

  void addSpending(String category, double amount, bool isExpense) {
    _spendings.add(
        Spending(category: category, amount: amount, isExpense: isExpense));
    notifyListeners(); // Notifies listeners about changes
  }
}
