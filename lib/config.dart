import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'languages/languages.dart';

bool isLogIn = true;
Color backGroundApp = const Color(0xff1a264a);

bool getIsEnglish(BuildContext context){
  return Provider.of<LanguageProvider>(context, listen: true).isEnglish;
}

String getTranslate(BuildContext context , String keyMap){
  return Provider.of<LanguageProvider>(context,listen: true).languageMap[keyMap].toString();
}