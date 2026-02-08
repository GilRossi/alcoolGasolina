import 'package:flutter/material.dart';

class PriceField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Color color;

  const PriceField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType:
      const TextInputType.numberWithOptions(decimal: true),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: color),
        prefixIcon: Icon(icon, color: color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: color.withOpacity(0.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}
