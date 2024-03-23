import 'package:flutter/material.dart';

class Spending extends StatelessWidget {
  final String category;
  final num amount; // Can represent both int and double types

  const Spending({
    super.key,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(16), // Provide some padding inside the container
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the category and the amount
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 16, // Font size
                fontWeight: FontWeight.bold, // Font weight
              ),
            ),
            Text(
              '¥${amount.toString()}', // Display amount with currency symbol
              style: const TextStyle(
                fontSize: 16, // Font size
                color: Colors.black54, // Font color
              ),
            ),
            // SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
