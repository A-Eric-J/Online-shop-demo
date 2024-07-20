import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:pixelfield_test_app/models/wine/wine.dart';

/// This [Repository] has 3 methods

class Repository {
  /// we use mockup JSON files instead of REST API, for fetching list of wines
  /// Note that when we are using [fetchWines] we should have internet connection
  Future<List<Wine>> fetchWines() async {
    final String response = await rootBundle.loadString('assets/mockup_data.json');
    final data = jsonDecode(response) as List;
    return data.map((wine) => Wine.fromJson(wine)).toList();
  }
///Data should be stored in the app and refresh after fetching
  Future<void> saveWines(List<Wine> wines) async {
    var box = await Hive.openBox<Wine>('wineBox');
    await box.clear();
    await box.addAll(wines);
  }
/// When the device is offline, we get the information from [Hive]
  /// Maybe at first we do not have internet connection and we have not save the data locally
  /// So we should show a message that we have no internet connection and there is no data in local storage
  Future<List<Wine>> getLocalWines() async {
    var box = await Hive.openBox<Wine>('wineBox');
    return box.values.toList();
  }
}
