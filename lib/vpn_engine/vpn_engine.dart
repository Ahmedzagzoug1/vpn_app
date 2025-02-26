import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vpn_basic_project/models/vpn_configration.dart';
import 'package:vpn_basic_project/models/vpn_status.dart';

class VpnEngine {
  static final eventChannelVpnStage = 'vpnStage';
  static final eventChannelVpnStatus = 'vpnStatus';
  static final methodChannelVpnControl = 'vpnControl';

  //  vpn connection stage snapshot
 static Stream<String> snapshotVpnStage() =>
      EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

  //  vpn connection status snapshot
  static Stream<VpnStatus> snapshotVpnStatus() => EventChannel(eventChannelVpnStatus)
      .receiveBroadcastStream()
      .map((eventStatus) => VpnStatus.fromJson(jsonDecode(eventStatus)))
      .cast();

  //start vpn connection
  static Future<void> startVpnConnection(VpnConfigration vpnConfig) async {
    try {
      await MethodChannel(methodChannelVpnControl).invokeMethod('start', {
        /*
       config = call.argument("config");
                    name = call.argument("country");
                    username = call.argument("username");
                    password = call.argument("password");
      */
        'config': vpnConfig.config,
        'country': vpnConfig.countryName,
        'username': vpnConfig.userName,
        'password': vpnConfig.password
      });
    } catch (e) {
      print('Error starting vpn connection: $e');
    }
  }

  //stop vpn connection
  static Future<void> stopVpnConnection() async {
    try {
      await MethodChannel(methodChannelVpnControl).invokeMethod('stop');
    } catch (e) {
      print('Error stopping vpn connection: $e');
    }
  }

  //kill switch vpn connection
  static Future<void> killVpnConnection() async {
    try {
      await MethodChannel(methodChannelVpnControl).invokeMethod('kill_switch');
    } catch (e) {
      print('Error killing vpn connection: $e');
    }
  }

  //refresh vpn connection
  static Future<void> refreshVpnConnection() async {
    try {
      await MethodChannel(methodChannelVpnControl).invokeMethod('refresh');
    } catch (e) {
      print('Error refreshing vpn connection: $e');
    }
  }

  //connection status
  static Future<String?> vpnStageNow() async {
    try {
      await MethodChannel(methodChannelVpnControl).invokeMethod('stage');
    } catch (e) {
      print('Error getting vpn connection status: $e');
    }
  }

  static Future<bool> vpnConection() async {
return vpnStageNow().then((value) => value!.toLowerCase() == 'connected');//285

  }
  //constants
  static const String CONNECTED = 'connected';
  static const String DISCONNECTED = 'disconnected';


}
