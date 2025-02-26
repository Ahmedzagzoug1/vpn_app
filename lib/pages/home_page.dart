import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/vpn_info.dart';
import 'package:vpn_basic_project/models/vpn_status.dart';
import 'package:vpn_basic_project/pages/available_vpn_servers_location_page.dart';
import 'package:vpn_basic_project/vpn_engine/vpn_engine.dart';
import 'package:vpn_basic_project/widgets/custom_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.sizeOf(context);
    VpnEngine.snapshotVpnStage().listen((event) {
      homeController.vpnconnectionState.value = event;
    });
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: locationSelectionButtomNavigation(context),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.to(AvailableVpnServersLocationPage());
            },
            child: Icon(Icons.perm_device_info),
          ),
          title: Text('VPN '),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.changeThemeMode(AppPreferences.isDarkMode
                      ? ThemeMode.light
                      : ThemeMode.dark);
                  AppPreferences.isDarkMode = !AppPreferences.isDarkMode;
                },
                icon: Icon(Icons.brightness_2_outlined)),
          ],
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Obx(
            () => Row(
              //changed
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomWidget(
                  title: (homeController.vpnInfo.value.countryLongName.isEmpty)
                      ? 'Location'
                      : homeController.vpnInfo.value.countryLongName,
                  subtitle: 'Free',
                  RoundedWidgetWithIcon: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.redAccent,
                    child:
                        (homeController.vpnInfo.value.countryLongName.isEmpty)
                            ? Icon(
                                Icons.flag_circle_outlined,
                                color: Colors.white,
                                size: 30,
                              )
                            : null,
                    backgroundImage: (homeController
                            .vpnInfo.value.countryLongName.isNotEmpty)
                        ? AssetImage(
                            'assets\countryFlags\{${homeController.vpnInfo.value.countryShortName}}.png')
                        : null,
                  ),
                ),
                CustomWidget(
                  title: (homeController.vpnInfo.value.countryLongName.isEmpty)
                      ? '60 ms'
                      : '${homeController.vpnInfo.value.ping} ms',
                  subtitle: 'Ping',
                  RoundedWidgetWithIcon: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.black54,
                    child: Icon(
                      Icons.graphic_eq,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => VpnRoundedButton()),
          StreamBuilder<VpnStatus>(
            initialData: VpnStatus(),
            stream: VpnEngine.snapshotVpnStatus(),
            builder: (context, snapshot) => Row(
              //changed
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomWidget(
                  title: snapshot.data?.byteIn ?? '0 kbps',
                  subtitle: 'Download',
                  RoundedWidgetWithIcon: CircleAvatar(
                    radius: 33,
                    backgroundColor: Color(0xff4FAE4C),
                    child: Icon(
                      Icons.arrow_circle_down_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                CustomWidget(
                  title: snapshot.data?.byteOut ?? '0 kbps',
                  subtitle: 'Upload',
                  RoundedWidgetWithIcon: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.flag_circle_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  locationSelectionButtomNavigation(BuildContext context) {
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.041),
          height: 62,
          color: Colors.redAccent,
          child: Row(
            children: [
              Icon(
                Icons.flag_circle_outlined,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Select Country/Location',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.redAccent,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget VpnRoundedButton() {
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: homeController.getRoundedVpnButtonColor.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      homeController.getRoundedVpnButtonColor.withOpacity(.3),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: screenSize.width * 0.25,
                  height: screenSize.height * 0.25,
                  decoration: BoxDecoration(
                    color: homeController.getRoundedVpnButtonColor,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        homeController.getRoundedVpnButtonText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
