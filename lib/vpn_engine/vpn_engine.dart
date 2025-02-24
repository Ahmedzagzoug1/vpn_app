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
  static Future<String?> vpnStage() async {
    try {
      await MethodChannel(methodChannelVpnControl).invokeMethod('stage');
    } catch (e) {
      print('Error getting vpn connection status: $e');
    }
  }

  static Future<bool> vpnConection() async {
return vpnStage().then((value) => value == 'CONNECTED');//285

  }
  //constants
  static const String CONNECTED = 'CONNECTED';
  static const String DISCONNECTED = 'DISCONNECTED';
  static const String CONNECTING = 'CONNECTING';
  static const String DISCONNECTING = 'DISCONNECTING';
  static const String RECONNECTING = 'RECONNECTING';
  static const String EXITING = 'EXITING';
  static const String NO_PROCESS = 'NO_PROCESS';
  static const String RESOLVE = 'RESOLVE';
  static const String TCP_CONNECT = 'TCP_CONNECT';
  static const String AUTH_FAILED = 'AUTH_FAILED';
  static const String NO_NETWORK = 'NO_NETWORK';
  static const String WAITORBOT = 'WAITORBOT';
}
