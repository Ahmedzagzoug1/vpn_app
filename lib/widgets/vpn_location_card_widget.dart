import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/controllers/controller_vpn_location.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/vpn_info.dart';
import 'package:vpn_basic_project/vpn_engine/vpn_engine.dart';

class VpnLocationCardWidget extends StatelessWidget {
  const VpnLocationCardWidget({super.key, required this.vpnInfo});
  final VpnInfo vpnInfo;
  String formatSpeedByte(int speedByte, int decimals) {
    if (speedByte <= 0) {
      "0 B";
    }
    const suffixesTitle = ['Bps', 'KBps', 'MBps', "GBps", 'TBps'];
    var speedTitleIndex = (log(speedByte) / log(1024)).floor();
    return "${(speedByte / pow(1024, speedTitleIndex)).toStringAsFixed(decimals)} ${suffixesTitle[speedTitleIndex]}";
  }

  @override
  Widget build(BuildContext context) {
    final controllerVpnLocation = Get.find<ControllerVpnLocation>();
    final homeController = Get.find<HomeController>();
    screenSize = MediaQuery.sizeOf(context);

    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          homeController.vpnInfo.value = vpnInfo;
          AppPreferences.vpnInfoObject = vpnInfo;
                    Get.back();

          if (homeController.vpnconnectionState == VpnEngine.CONNECTED) {
            VpnEngine.stopVpnConnection();
            Future.delayed(Duration(seconds: 5),()=>
            homeController.connectToVpnNow());
          }else{
                                  print('${homeController.vpnconnectionState.value.toString()}');

            homeController.connectToVpnNow();

          }

        },
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Container(
            padding: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              'assets/countryFlags/${vpnInfo.countryShortName.toLowerCase()}.png',
              height: 40,
              width: screenSize.width * .15,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(vpnInfo.countryLongName),
          subtitle: Row(
            children: [
              Icon(
                Icons.shutter_speed,
                color: Colors.redAccent,
                size: 40,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                formatSpeedByte(vpnInfo.Speed, 2),
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          //number of subscritions
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${vpnInfo.numVpnSessions}',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).lightTextColor,
                    fontSize: 13),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                CupertinoIcons.person_2_alt,
                color: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
