import 'package:flutter/material.dart';

import 'languages.dart';

class LanguageProvider with ChangeNotifier {
  bool isEnglish = true;
  Map<String, String> languageMap = englishLanguage;

  void myChangeLanguage() {
    isEnglish = !isEnglish;
    if (isEnglish == true) {
      languageMap = englishLanguage;
    } else {
      languageMap = arabicLanguage;
    }
    notifyListeners();
  }

  //for get text
  String getText(String keyMap) {
    return languageMap[keyMap].toString();
  }
}
