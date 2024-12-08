import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  static Box? _myBox;


  static Future<bool> initializeHiveAndRegisterAdapters() async {
    /// Do not edit this method until you need a new adapter
    try {
      Directory? appDocDir = await getApplicationDocumentsDirectory();
      String dbFilePath = [appDocDir!.path, 'o_women_db'].join('/');
      debugPrint("dbFilePath$dbFilePath");
      Hive.init(dbFilePath);
      _myBox = await Hive.openBox('myBox');
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> insertData(String key, var value) async {

    await _myBox!.put(key, value);
    //var name = getData(key);
   // debugPrint("name print hive $name");
  }

  static dynamic getData(String key) {
    return _myBox!.get(key);
  }


  Future<void> deleteItem(String itemKey) async {
    await _myBox!.delete(itemKey);
  }

  static Future<void> clearUserData() async {

    await Hive.box("myBox").clear();
  }

  static Future<void> closeBox() async {
    // Close the Hive box when done
    await _myBox!.close();
  }


}