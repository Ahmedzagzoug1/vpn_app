import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/models/vpn_configration.dart';
import 'package:vpn_basic_project/models/vpn_info.dart';
import 'package:vpn_basic_project/vpn_engine/vpn_engine.dart';

class HomeController extends GetxController {
  final Rx<VpnInfo> vpnInfo = AppPreferences.vpnInfoObject.obs;
  final vpnconnectionState = VpnEngine.DISCONNECTED.obs;

  void connectToVpnNow() async {
    if (vpnInfo.value.base64OpenVPNConfigData.isEmpty) {
      Get.snackbar('Country/Location', 'Please Select Country/Location First');
      return;
    }
    //disconnected
    if (vpnconnectionState.value == VpnEngine.DISCONNECTED) {
      final dataConfigVpn =
          Base64Decoder().convert(vpnInfo.value.base64OpenVPNConfigData);
      final configration = Utf8Decoder().convert(dataConfigVpn);
      final vpnConfigration = VpnConfigration(
          userName: 'vpn',
          password: 'vpn',
          countryName: vpnInfo.value.countryLongName,
          config: configration);
      print('${vpnConfigration.userName.toString()} ahmed');
      await VpnEngine.startVpnConnection(vpnConfigration);
    }else{
      print('${vpnconnectionState.value} stopped');
    await  VpnEngine.stopVpnConnection();
    }
  }

  Color get getRoundedVpnButtonColor {
    switch (vpnconnectionState.value) {
      case VpnEngine.CONNECTED:
        return Colors.green;
      case VpnEngine.DISCONNECTED:
        return Colors.redAccent;
      default:
        return Colors.orangeAccent;
    }
  }

  String get getRoundedVpnButtonText {
    switch (vpnconnectionState.value) {
      case VpnEngine.CONNECTED:
        return 'Disconnect';
      case VpnEngine.DISCONNECTED:
        return 'Let\'s Connect';
      default:
        return 'Connection...';
    }
  }
}
