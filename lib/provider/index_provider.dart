import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_storage/shared_preferences_key.dart';

class IndexProvider extends ChangeNotifier{
    int _currentIndex = 1;

   // IndexProvider(){
   //   _loadPrevIndex();
   // }
   //
   // Future<void> _loadPrevIndex() async {
   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //   _currentIndex = prefs.getInt(KeyType.currentIndex) ?? 1;
   //   notifyListeners();
   // }

  int get index => _currentIndex;


  void updateIndex(int index) async{
    _currentIndex = index;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(KeyType.currentIndex, _currentIndex);
    notifyListeners();
  }

}