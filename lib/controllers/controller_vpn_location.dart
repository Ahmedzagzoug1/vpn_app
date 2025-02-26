import 'package:get/get.dart';
import 'package:vpn_basic_project/api_vpn_gate/api_vpn_gate.dart';
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/models/vpn_info.dart';

class ControllerVpnLocation extends GetxController{
  List<VpnInfo> vpnFreeServersAvailableList = AppPreferences.vpnInfoList;
  final RxBool isLoadingNewLocation = false.obs;
  Future<void> retrieveVpnInformation()async{
    isLoadingNewLocation.value = true;
    vpnFreeServersAvailableList.clear();
    vpnFreeServersAvailableList = await ApiVpnGate.retrieveAllAvailableVpnFreeSevers();
    isLoadingNewLocation.value = false;
  }
}