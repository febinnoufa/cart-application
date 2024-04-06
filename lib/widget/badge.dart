import 'package:flutter/material.dart';

class BadgeClas extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;
  final Color textColor;

  BadgeClas({
    required this.child,
    required this.value,
    this.color = Colors.red,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
   return Stack(
  alignment: Alignment.center,
  clipBehavior: Clip.none,
  children: [
    child,
    Positioned(
      right: -10, // Adjust the positioning if necessary
      top: -10, // Adjust the positioning if necessary
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        constraints: const BoxConstraints(
          minWidth: 20, // Increase the size as needed
          minHeight: 20, // Increase the size as needed
        ),
        child: Text(
          value,
          style: TextStyle(
            color: textColor,
            fontSize: 12, // Adjust the font size if necessary
          ),
          textAlign: TextAlign.center,
        ),
      ),
    )
  ],
);

  }
}
