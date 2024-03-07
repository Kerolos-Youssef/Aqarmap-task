import 'package:flutter/material.dart';

extension OnContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get mWidth {
    return MediaQuery.of(this).size.width;
  }

  double get mHeight {
    return MediaQuery.of(this).size.height;
  }

  dynamic push(Widget widget) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  dynamic pushReplacement(Widget widget) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  dynamic pushReplacementNamed(String name, {dynamic args}) {
    return Navigator.pushReplacementNamed(this, name, arguments: args);
  }

  dynamic pushAndRemoveUntil(Widget widget) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => widget),
      (_) => false,
    );
  }

  dynamic pushNamedAndRemoveUntil(String name, {dynamic args}) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      name,
      (_) => false,
      arguments: args,
    );
  }

  dynamic pushNamed(String screenName, {dynamic args}) {
    return Navigator.pushNamed(
      this,
      screenName,
      arguments: args,
    );
  }

  dynamic pop({dynamic data}) {
    return Navigator.pop(
      this,
      data,
    );
  }

  Future<bool> get maybePop async {
    return await Navigator.maybePop(this);
  }

  bool get canPop {
    return Navigator.canPop(this);
  }

  Orientation get mOrientation {
    return MediaQuery.of(this).orientation;
  }

  double get width => mWidth;

  double get height => mHeight;

  double get textMaxWidth => 450;

  bool get isEn => Localizations.localeOf(this).languageCode == 'en';

  bool get isAr => Localizations.localeOf(this).languageCode == 'ar';

  String get lng => Localizations.localeOf(this).languageCode;
}
