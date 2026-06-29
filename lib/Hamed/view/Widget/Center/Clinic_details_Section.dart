import 'package:flutter/material.dart';

class ClinicDetailsSection extends StatelessWidget {
  const ClinicDetailsSection({
    super.key,
    required this.sectionName,
    required this.info,
    this.icon = Icons.circle,
    this.iconSize = 8,
  });
  final String sectionName;
  final List<String> info;
  final IconData icon;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  size: iconSize,
                ),
              ),
              Text(
                "Botox",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  size: iconSize,
                ),
              ),
              Text(
                "Botox",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  size: iconSize,
                ),
              ),
              Text(
                "Botox",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
