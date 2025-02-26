import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vpn_basic_project/models/vpn_info.dart';

class AppPreferences {
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

  static bool get isDarkMode => box_of_hive.get('is_dark_mode') ?? false;
  static set isDarkMode(bool value) => box_of_hive.put('is_dark_mode', value);

//save single server
  static VpnInfo get vpnInfoObject =>
      VpnInfo.fromJson(jsonDecode( box_of_hive.get('vpn' )?? "{}"));
  static set vpnInfoObject(VpnInfo value) =>
      box_of_hive.put('vpn', jsonEncode(value));

      //save all servers
  static List<VpnInfo> get vpnInfoList {
    List<VpnInfo> tempVpnList=[];
   final dataVpn=jsonDecode( box_of_hive.get('vpn_list' )?? '[]' )??[];
for (var data in dataVpn) {

      tempVpnList.add(VpnInfo.fromJson(data));
    }
    return tempVpnList;
  }

  static set vpnInfoList(List<VpnInfo> value) =>
      box_of_hive.put('vpn_list', jsonEncode(value));
}
