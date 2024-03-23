import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/spending.dart'; // Ensure this import matches your project structure
import 'widgets/spendingWidget.dart';
import 'recordingPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Consumer<SpendingListProvider>(
                builder: (context, spendingListProvider, child) {
                  // Calculate totals
                  double totalExpenses = spendingListProvider.spendings
                      .where((spending) => spending.isExpense)
                      .fold(0.0, (sum, item) => sum + item.amount);
                  double totalIncome = spendingListProvider.spendings
                      .where((spending) => !spending.isExpense)
                      .fold(0.0, (sum, item) => sum + item.amount);

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              elevation: 4.0,
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "支出",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "¥${totalExpenses.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              elevation: 4.0,
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "收入",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "¥${totalIncome.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            // ... Rest of your widget build method
          ],
        ),
      ),
      // ... Your BottomNavigationBar
    );
  }
}
