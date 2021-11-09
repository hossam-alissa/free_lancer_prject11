import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'languages.dart';

bool getIsEnglish(BuildContext context){
  return Provider.of<LanguageProvider>(context, listen: true).isEnglish;
}

String getTranslate(BuildContext context , String keyMap){
  return Provider.of<LanguageProvider>(context,listen: true).languageMap[keyMap].toString();
}

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
