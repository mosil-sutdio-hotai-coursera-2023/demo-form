import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    // 標題的寫法
    return Container(
      child: Text(label),
    );
  }
}
