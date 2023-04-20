import 'dart:convert';

import 'package:deom_form/model/form_model.dart';
import 'package:deom_form/model/options.dart';
import 'package:deom_form/utils/preferences.dart';
import 'package:deom_form/widgets/label_widget.dart';
import 'package:flutter/material.dart';

class FormResultPage extends StatelessWidget {
  FormResultPage({Key? key, required this.result}) : super(key: key);
  final String result;
  late FormModel model;

  @override
  Widget build(BuildContext context) {
    model = FormModel.fromJson(jsonDecode(result));
    return Scaffold(
      appBar: AppBar(
        title: const Text("表單呈現"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const LabelWidget("基本資料"),
            ListTile(
              title: Text(model.displayName),
              subtitle: const Text("顯示名稱"),
            ),
            ListTile(
              title: Text(model.email),
              subtitle: const Text("電子郵件"),
            ),
            const LabelWidget("性別"),
            ListTile(
              leading: const Icon(Icons.accessibility),
              title: Text(model.gender.text),
            ),
            const LabelWidget("興趣"),
            ..._buildHabitList(),
            ElevatedButton(
              onPressed: () {
                Preferences.save(model);
                Navigator.of(context).pop();
                Navigator.of(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("儲存"),
            ),
          ],
        ),
      ),
    );
  }

  /// 建立興趣的列表 Widget
  List<Widget> _buildHabitList() {
    List<Widget> list = [];
    // 使用 ListTile 將 habit options 呈現出來
    return list;
  }
}
