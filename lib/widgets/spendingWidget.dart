import 'package:flutter/material.dart';

class Spending extends StatelessWidget {
  final String category;
  final num amount;
  final bool isExpense;

  const Spending({
    super.key,
    required this.category,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = isExpense ? Colors.deepOrange : Colors.teal[800];
    final textColor = isExpense ? Colors.white : Colors.black;
    String amountString = isExpense ? '-¥$amount' : '+¥$amount';

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorTheme!
              .withOpacity(0.2), // Use the color theme with reduced opacity
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: colorTheme
                  .withOpacity(0.3), // Use the color theme for the shadow
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        textColor, // Use the text color based on the color theme
                  ),
                ),
                const SizedBox(height: 4), // Add some spacing
                Icon(
                  isExpense ? Icons.arrow_circle_down : Icons.arrow_circle_up,
                  color: colorTheme, // Use the color theme for the icon
                  size: 18,
                ),
              ],
            ),
            Text(
              amountString,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorTheme, // Use the color theme for the amount
              ),
            ),
          ],
        ),
      ),
    );
  }
}
