import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.orange),
        ),
        const Divider(
          thickness: 2.0,
          color: Colors.deepOrange,
        ),
      ],
    );
  }
}
