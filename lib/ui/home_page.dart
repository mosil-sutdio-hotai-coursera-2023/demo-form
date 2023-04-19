import 'package:deom_form/ui/form_page.dart';
import 'package:deom_form/utils/preferences.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "還沒有填寫資料";

  @override
  void initState() {
    super.initState();
    _setInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo")),
      body: Center(
        child: Column(
          children: [
            Text(text),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                bool? result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FormPage(),
                  ),
                );

                if (result != null && result) {
                  _setInfo();
                }
              },
              child: const Text("填寫表單"),
            ),
            TextButton(
              onPressed: () {
                Preferences.clear();
                _setInfo();
              },
              child: const Text("清除資料"),
            ),
          ],
        ),
      ),
    );
  }

  /// 呈現資料
  _setInfo() {
    String name = Preferences.getString("name", "");
    if (name.isNotEmpty) {
      setState(() {
        text = "您的名稱是：$name\n您的 email 是 ${Preferences.getString("email", "")}";
      });
    }
  }
}
