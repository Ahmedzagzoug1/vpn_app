import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/models/vpn_info.dart';

class ApiVpnGate {
  static Future<List<VpnInfo>> retrieveAllAvailableVpnFreeSevers() async {
    //https://www.vpngate.net/api/iphone/
    List<VpnInfo> vpnServersList = [];
    try {
      final response =
          await http.get(Uri.parse('https://www.vpngate.net/api/iphone/'));
      final commaSparatorFromValue =
          response.body.split('#')[1].replaceAll('*', '');
      List<List<dynamic>> listData =
          CsvToListConverter().convert(commaSparatorFromValue);
      final header = listData[0];
      for (int counter = 1; counter < listData.length - 1; counter++) {
        Map<String, dynamic> jsonData = {};
        for (int innetCounter = 0;
            innetCounter < header.length;
            innetCounter++) {
          jsonData
              .addAll({header[innetCounter]: listData[counter][innetCounter]});
        }
        vpnServersList.add(VpnInfo.fromJson(jsonData));

      }

    } catch (errorMessage) {
      Get.snackbar(
        'Error Message',
        errorMessage.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white.withOpacity(.8),
      );
    }
    vpnServersList.shuffle();
    //save vpn list to App preferences
    if(vpnServersList.isNotEmpty) AppPreferences.vpnInfoList = vpnServersList;
    return vpnServersList;
  }
}
