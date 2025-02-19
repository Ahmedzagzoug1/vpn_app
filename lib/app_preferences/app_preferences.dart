import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class AppPreferences{
  static late Box box_of_hive;
/*************  ✨ Codeium Command ⭐  *************/
  /// Initializes the Hive box for storing application preferences.
  /// 
  /// This method opens a Hive box named 'app_preferences' and assigns it to 
  /// the static variable `box_of_hive` for storing key-value pairs of 
  /// application preferences.
  /// 
  /// Returns a [Future] that completes when the box is successfully opened.

/******  eb27c399-94e7-4dde-b070-065211a9a039  *******/
 static Future<void> initHive() async {
   await Hive.initFlutter();
    box_of_hive = await Hive.openBox('app_preferences');
  }
  static bool get isDarkMode => box_of_hive.get('is_dark_mode')??false;
  static set isDarkMode(bool value) => box_of_hive.put('is_dark_mode', value);
}