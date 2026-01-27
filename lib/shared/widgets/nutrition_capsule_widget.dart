import 'package:flutter/material.dart';

Widget nutritionCapsule({
  required String label,
  required String value,
  Color topColor = const Color(0xFFFFF4B0),
  Color bottomColor = const Color(0xFFFFE08A),
  Color labelColor = const Color(0xFF0A2A66),
  Color valueColor = const Color(0xFFD96C00),
}) {
  return Container(
    width: 70,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: bottomColor,
    ),
    child: Column(
      children: [
        // TOP
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: topColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: labelColor,
            ),
          ),
        ),

        const Spacer(),

        // BOTTOM
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: valueColor,
            ),
          ),
        ),
      ],
    ),
  );
}
