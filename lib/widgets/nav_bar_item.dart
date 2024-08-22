import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const CustomBottomNavBarItem({super.key,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? primary : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : primary,
        size: 24,
      ),
    );
  }
}