import 'package:flutter/material.dart';
import 'widgets/spending.dart';

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
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                    16, 16, 0, 10), // Added left padding
                alignment: Alignment.topLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 34, // Bigger font size
                      fontWeight: FontWeight.normal,
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "你这周还可以花"), // Regular text
                      TextSpan(
                        text: "250元",
                        style: TextStyle(
                          fontSize: 38, // Even larger font size for the number
                          fontWeight: FontWeight.bold,
                          color: Colors.red, // Highlight color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            elevation: 4.0, // Adjust the elevation as needed
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "支出",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                      height:
                                          4.0), // Spacing for aesthetic purposes
                                  Text(
                                    "¥5000",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .deepOrange, // Adjust the color as needed
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
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "收入",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "¥10000",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .green, // Adjust the color as needed
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 16,
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
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shadowColor: Colors.transparent, // No shadow
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical:
                                    16.0), 
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                          ),
                          child: const Text(
                            '记一笔',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white), // Increase font size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: const [
                    Spending(category: "餐饮", amount: 500),
                    // Add more Spending widgets here
                  ],
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
