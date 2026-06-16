import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: const [
          DropdownMenuItem(
            value: 'Espresso',
            child: Text('Espresso'),
          ),
          DropdownMenuItem(
            value: 'Cappuccino',
            child: Text('Cappuccino'),
          ),
          DropdownMenuItem(
            value: 'Latte',
            child: Text('Latte'),
          ),
          DropdownMenuItem(
            value: 'Mocha',
            child: Text('Mocha'),
          ),
          DropdownMenuItem(
            value: 'Americano',
            child: Text('Americano'),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}