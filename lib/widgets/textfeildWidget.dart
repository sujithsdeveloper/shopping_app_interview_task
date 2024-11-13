import 'package:flutter/material.dart';

class textfeildwidget extends StatelessWidget {
  const textfeildwidget({
    super.key,
    required this.titleController,
    required this.label,
  });

  final TextEditingController titleController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: titleController,
        decoration: InputDecoration(
            filled: true,
            label: Text(label),
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
