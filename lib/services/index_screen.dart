import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

int getIndexScreen(BuildContext context){
  return Provider.of<IndexScreen>(context,listen: true).indexScreen;
}
changeIndexScreen(BuildContext context , index){
  Provider.of<IndexScreen>(context, listen: false)
      ._changeIndexScreen(index);
}

class IndexScreen with ChangeNotifier{
  int indexScreen = 0;

  void _changeIndexScreen(int index){
    indexScreen = index;
    notifyListeners();
  }
}