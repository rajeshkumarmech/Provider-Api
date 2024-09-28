import 'package:flutter/material.dart';
import 'package:interns1/modelservice/modelservice.dart';

class providercall extends ChangeNotifier {
  final call = ServiceJson();
  bool loading = false;
  List<JsonApi> fetch = [];
  List<JsonApi> get data => fetch;
  Future<void> futureData() async {
    loading = true;
    notifyListeners();
    final response = await call.getdata();
    fetch = response;
    loading = true;
    notifyListeners();
  }

  ThemeData theme = ThemeData.dark();
  ThemeData get themes => theme;
  void colorchange() {
    final dcolor = theme == ThemeData.dark();
    if (dcolor) {
      theme = ThemeData.light();
    } else {
      theme = ThemeData.dark();
    }
    notifyListeners();
  }
}
