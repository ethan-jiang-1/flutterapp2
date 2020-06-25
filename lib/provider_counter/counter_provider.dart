import 'package:flutter/material.dart';
 
class CounterProvider with ChangeNotifier {
  int _count0 = 0;
  int _count1 = 100;
 
  int get value0 => _count0;
 
  int get value1 => _count1;
 
  void increment0() {
    _count0++;
    notifyListeners();
  }
 
  void increment1() {
    _count1++;
    notifyListeners();
  }
}