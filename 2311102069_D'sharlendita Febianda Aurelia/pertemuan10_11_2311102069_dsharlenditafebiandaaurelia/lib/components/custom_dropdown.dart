import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: const [
          DropdownMenuItem(
            value: 'Flutter',
            child: Text('Flutter'),
          ),
          DropdownMenuItem(
            value: 'Dart',
            child: Text('Dart'),
          ),
          DropdownMenuItem(
            value: 'Firebase',
            child: Text('Firebase'),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}