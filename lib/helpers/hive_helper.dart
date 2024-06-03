import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<void> openBox(String boxName) async {
    await Hive.openBox(boxName);
  }

  static Box getBox(String boxName) {
    return Hive.box(boxName);
  }

  static Future<void> putData({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    var box = Hive.box(boxName);
    await box.put(key, value);
  }

  static dynamic getData({
    required String boxName,
    required String key,
  }) {
    var box = Hive.box(boxName);
    return box.get(key);
  }

  static Future<void> deleteData({
    required String boxName,
    required String key,
  }) async {
    var box = Hive.box(boxName);
    await box.delete(key);
  }
}
