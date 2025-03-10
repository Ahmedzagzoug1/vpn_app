import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/pages/home_page.dart';
late Size screenSize;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await AppPreferences.initHive(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: AppPreferences.isDarkMode?ThemeMode.dark:ThemeMode.light ,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          
          centerTitle: true,
          elevation: 3,
        ),
      ),
      darkTheme: ThemeData(brightness:Brightness.dark,
appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 3,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
extension AppTheme on ThemeData{
  Color get lightTextColor => AppPreferences.isDarkMode?Colors.white70:Colors.black54;
  Color get bottomNavigationColor => AppPreferences.isDarkMode?Colors.white12:Colors.redAccent;
}