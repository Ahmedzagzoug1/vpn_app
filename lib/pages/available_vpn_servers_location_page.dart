import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vpn_basic_project/controllers/controller_vpn_location.dart';
import 'package:vpn_basic_project/widgets/loading_widget_ui.dart';
import 'package:vpn_basic_project/widgets/no_vpn_server_founded_ui_widget.dart';
import 'package:vpn_basic_project/widgets/vpn_location_card_widget.dart';

class AvailableVpnServersLocationPage extends StatelessWidget {
  AvailableVpnServersLocationPage({super.key});
  final controllerVpnLocation = ControllerVpnLocation();
  @override
  Widget build(BuildContext context) {
    if (controllerVpnLocation.vpnFreeServersAvailableList.isEmpty) {
      controllerVpnLocation.retrieveVpnInformation();
    }
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('Vpn Location (' +
                controllerVpnLocation.vpnFreeServersAvailableList.length
                    .toString() +
                ')'),
          ),
          body: controllerVpnLocation.isLoadingNewLocation.value
              ? LoadingWidgetUI()
              : controllerVpnLocation.vpnFreeServersAvailableList.isEmpty
                  ? NoVpnServerFoundedUIWidget()
                  : vpnAvaibleServerData(),
        ));
  }

  vpnAvaibleServerData() {
    return ListView.builder(
        itemCount: controllerVpnLocation.vpnFreeServersAvailableList.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(4),
        itemBuilder: (context, index) {
          return VpnLocationCardWidget(
              vpnInfo:
                  controllerVpnLocation.vpnFreeServersAvailableList[index]);
        });
  }
}
