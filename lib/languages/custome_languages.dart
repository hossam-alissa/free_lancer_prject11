import '../config.dart';
import 'languages.dart';


//for get text
String getText(String keyMap) {
  if (isEnglish == false) {
    return arabicLanguage[keyMap].toString();
  } else {
    return englishLanguage[keyMap].toString();
  }
}
