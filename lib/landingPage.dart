import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/spending.dart';
import 'widgets/spendingWidget.dart';
import 'recordingPage.dart';
import 'chatPage.dart';

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
    if (index == 1) {
      // Navigate to ChatPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatPage()),
      );
    }
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Container(
                width: double.infinity,
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecordingPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      '记一笔',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<SpendingListProvider>(
                  builder: (context, spendingListProvider, child) {
                    return ListView.builder(
                      reverse: false, // This will reverse the order of the list items
                      itemCount: spendingListProvider.spendings.length,
                      itemBuilder: (context, index) {
                        final spending = spendingListProvider.spendings[spendingListProvider.spendings.length - 1 - index]; // Access items from the end of the list
                        return Spending(
                          category: spending.category,
                          amount: spending.amount,
                          isExpense: spending.isExpense,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '建议',
            //navigate to ChatPage
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '图表',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}