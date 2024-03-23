import 'package:flutter/material.dart';
import 'widgets/chatgpt.dart';
// import 'widgets/suggestions.dart';

class ComPage extends StatefulWidget {
  const ComPage({super.key});

  @override
  State<ComPage> createState() => _ComPage();
}

class _ComPage extends State<ComPage> {
  int _selectedIndex = 1;

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
              flex: 4,
              child: ChatPage(), // Your chat page widget
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
