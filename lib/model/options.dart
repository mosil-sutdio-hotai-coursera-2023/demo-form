enum GenderOption {
  male,
  female,
  none,
}

extension GenderOptionEx on GenderOption {
  String get text {
    switch (this) {
      case GenderOption.male:
        return "男";
      case GenderOption.female:
        return "女";
      case GenderOption.none:
        return "不想填";
    }
  }
}

enum HabitOption { basketball, baseball, hiking, mountaineering, swim }

extension HabitOptionEx on HabitOption {
  String get text {
    switch (this) {
      case HabitOption.basketball:
        return "籃球";
      case HabitOption.baseball:
        return "棒球";
      case HabitOption.hiking:
        return "健行";
      case HabitOption.mountaineering:
        return "爬山";
      case HabitOption.swim:
        return "游泳";
    }
  }
}
