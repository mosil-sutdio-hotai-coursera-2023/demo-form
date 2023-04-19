import 'dart:convert';

import 'package:deom_form/model/options.dart';

class FormModel {
  String email;
  String displayName;
  bool isAgree;
  GenderOption gender;

  bool isBasketball = false;
  bool isBaseball = false;
  bool isHiking = false;
  bool isMountaineering = false;
  bool isSwim = false;

  FormModel({
    this.email = "",
    this.displayName = "",
    this.gender = GenderOption.none,
    this.isAgree = false,
    this.isBasketball = false,
    this.isBaseball = false,
    this.isHiking = false,
    this.isMountaineering = false,
    this.isSwim = false,
  });

  /// 將 Map 轉成物件
  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        email: json['email'] as String,
        displayName: json['display_name'] as String,
        isAgree: json['is_agree'] as bool,
        gender: GenderOption.values[json['gender'] as int],
        isBasketball: json['is_basketball'] as bool,
        isBaseball: json['is_baseball'] as bool,
        isHiking: json['is_hiking'] as bool,
        isMountaineering: json['is_mountaineering'] as bool,
        isSwim: json['is_swim'] as bool,
      );

  /// 將物件轉成 Json String
  Map<String, dynamic> toJson() => {
        'email': email,
        'display_name': displayName,
        'is_agree': isAgree,
        'gender': gender.index,
        'is_basketball': isBasketball,
        'is_baseball': isBaseball,
        'is_hiking': isHiking,
        'is_mountaineering': isMountaineering,
        'is_swim': isSwim,
      };
}
