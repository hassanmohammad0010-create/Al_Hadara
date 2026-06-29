import 'package:flutter/material.dart';

class NamedDivider extends StatelessWidget {
  const NamedDivider({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.black,
          width: 40,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black,
            height: 1,
          ),
        ),
      ],
    );
  }
}
