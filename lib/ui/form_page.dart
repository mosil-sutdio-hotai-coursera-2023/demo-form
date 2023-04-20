import 'dart:convert';

import 'package:deom_form/model/form_model.dart';
import 'package:deom_form/model/options.dart';
import 'package:deom_form/ui/form_result_page.dart';
import 'package:deom_form/widgets/label_widget.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FormModel model = FormModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("填寫表單"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              TextFormField(
                controller: _displayNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "請輸入顯示名稱";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "顯示名稱",
                  hintText: "請填寫你要顯示的名稱",
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "請填入 email";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "電子郵件",
                  hintText: "請填寫你的信箱",
                ),
              ),
              const SizedBox(height: 40.0),
              const LabelWidget("性別"),
              ..._buildRadio(),
              const SizedBox(height: 40.0),
              const LabelWidget("興趣"),
              CheckboxListTile(
                title: Text(HabitOption.basketball.text),
                value: model.isBasketball,
                onChanged: (value) {
                  setState(() {
                    model.isBasketball = value ?? false;
                  });
                },
              ),
              // 加入 CheckBox
              const Text("是否同意"), // 改用 Switch
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    _showErrorMessage(context);
                    return;
                  }
                  if (!model.isAgree) {
                    _showAgree(context);
                    return;
                  }
                  model.displayName = _displayNameController.text;
                  model.email = _emailController.text;
                  print(jsonEncode(model));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FormResultPage(result: jsonEncode(model));
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("送出"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 建立 Radio 的畫面
  List<Widget> _buildRadio() {
    List<Widget> list = [];
    // 補上回圈
    return list;
  }
  /// Radio 產生變化的設定
  void _handleRadioChange(GenderOption value) {
    setState(() {
      model.gender = value;
    });
  }

  /// 使用 SnackBar 來顯示錯誤訊息
  void _showErrorMessage(BuildContext conetxt) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('有資料未填')),
    );
  }

  /// 使用 Dialog 來顯示錯誤訊息
  void _showAgree(BuildContext context) {
    // 跳 AlterDialog
  }
}
