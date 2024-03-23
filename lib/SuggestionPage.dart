import 'package:flutter/material.dart';
import 'widgets/chatgpt.dart';
// import 'widgets/suggestions.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({super.key});

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
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
                      TextSpan(text: "我想要省"), // Regular text
                      TextSpan(
                        text: "1000000元",
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
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  // alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            elevation: 4.0, // Adjust the elevation as needed
                            child: Container(
                              width: 200, // Set the width as needed
                              height: 120, // Set the height as needed
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "今天能省",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                      height:
                                          4.0), // Spacing for aesthetic purposes
                                  Text(
                                    "¥80",
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
                              width: 200, // Set the width as needed
                              height: 120, // Set the height as needed
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "今天能花",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "¥50",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            elevation: 4.0, // Adjust the elevation as needed
                            child: Container(
                              width: 200, // Set the width as needed
                              height: 120, // Set the height as needed
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "累计已省",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                      height:
                                          4.0), // Spacing for aesthetic purposes
                                  Text(
                                    "¥8000",
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
                              width: 200, // Set the width as needed
                              height: 120, // Set the height as needed
                              padding: const EdgeInsets.all(16.0),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "居然已经省了",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "7天",
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
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     padding: const EdgeInsets.all(120.0),
            //     child: Ink(
            //       decoration: BoxDecoration(
            //         gradient: const LinearGradient(
            //           colors: [Colors.purple, Colors.deepPurple],
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight,
            //         ),
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       child: ElevatedButton(
            //         onPressed: () {
            //           // Handle button press
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.deepPurple,
            //           shadowColor: Colors.transparent, // No shadow
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 32.0, vertical: 16.0),
            //           shape: RoundedRectangleBorder(
            //             borderRadius:
            //                 BorderRadius.circular(20), // Rounded corners
            //           ),
            //         ),
            //         child: const Text(
            //           '省钱钱',
            //           style: TextStyle(
            //             fontSize: 20, // Increase font size
            //             color: Colors.white, // Change text color
            //             fontWeight: FontWeight.bold, // Make text bold
            //             letterSpacing: 1.2, // Increase letter spacing
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
