import 'package:flutter/material.dart';

class GeneralHelper {
  const GeneralHelper._();

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
