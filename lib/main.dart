import 'package:deom_form/ui/home_page.dart';
import 'package:deom_form/utils/preferences.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // 在非同步的呼叫時，需確保 Flutter framework 有被叫起才往下執行。
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const FormDemoApp());
}

class FormDemoApp extends StatelessWidget {
  const FormDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
