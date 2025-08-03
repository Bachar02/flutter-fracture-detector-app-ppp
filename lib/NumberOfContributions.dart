import 'package:flutter/cupertino.dart';

class NumberOfContributions with ChangeNotifier{
  int _nbContrib = 0;

  int get nbContrib => _nbContrib;

  void incContrib(){
    _nbContrib++;
    notifyListeners();
  }
}