import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_base/generated/l10n.dart';

extension BuildContextExtension on BuildContext {
  /// Theme Getter
  ThemeData get theme => Theme.of(this);

  /// App Localization extension.
  S get l10n => S.of(this);

  /// Bloc TryRead Errors.
  T? tryRead<T>() {
    try {
      return read<T>();
    } catch (e) {
      log('Error reading bloc: $e');
      return null;
    }
  }
}

extension StringExt on String {
  bool isVersionGreaterThan(String currentVersion) {
    final version1List = (this).split('.').toList();
    final version2List = currentVersion.split('.').toList();
    var indexV1 = 0;
    var indexV2 = 0;

    while (indexV1 < version1List.length && indexV2 < version2List.length) {
      final splitV1 = int.tryParse(version1List[indexV1++]) ?? 0;
      final splitV2 = int.tryParse(version2List[indexV2++]) ?? 0;

      if (splitV1 > splitV2) return true;
      if (splitV1 < splitV2) return false;
    }

    while (indexV1 < version1List.length) {
      if ((int.tryParse(version1List[indexV1++]) ?? 0) > 0) return true;
    }

    while (indexV2 < version2List.length) {
      if ((int.tryParse(version2List[indexV2++]) ?? 0) > 0) return false;
    }

    return false;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasSpecialCharacter {
    final passwordRegExp = RegExp(r'[!@#$\><*~]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasCapitalLetter {
    final passwordRegExp = RegExp(r'[A-Z]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasLowerCaseLetter {
    final passwordRegExp = RegExp(r'[a-z]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasNumber {
    final passwordRegExp = RegExp(r'[0-9]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

extension MapExtensions on Map {
  void clearNullValues() {
    return removeWhere((dynamic key, dynamic value) => value == null);
  }
}

/// TODO DEVELOPER: Every New Page have PageNavigateMixin for Go Router to work.
mixin PageNavigateMixin on StatelessWidget {
  @factory
  String get goName;

  @factory
  String get routeName;

  String get goNameWithSlash => '/$goName';
}
