import 'package:flutter/material.dart';

//card Row model

Widget buildCardRow(String label, String amount, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF8B69FF)),
            const SizedBox(width: 10.0),
            Text(label),
          ],
        ),
        Text(amount, textAlign: TextAlign.right),
      ],
    ),
  );
}