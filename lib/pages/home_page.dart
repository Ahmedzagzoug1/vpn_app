import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/app_preferences/app_preferences.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/widgets/custom_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize = MediaQuery.sizeOf(context);
    return SafeArea(
      child:Scaffold(
          bottomNavigationBar: locationSelectionButtomNavigation(context),
          appBar: AppBar(
            leading: InkWell(
              onTap: () {},
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
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  //changed
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomWidget(
                      title: 'Location',
                      subtitle: 'Free',
                      RoundedWidgetWithIcon: CircleAvatar(
                        radius: 33,
                        backgroundColor: Colors.redAccent,
                        child: Icon(
                          Icons.flag_circle_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    CustomWidget(
                      title: '60 ms',
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
                VpnRoundedButton(),
                Row(
                  //changed
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomWidget(
                      title: '0 kbps',
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
                      title: '0 kbps',
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
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.041),
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
        onTap: () {
          
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18),
               decoration:    BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child:Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: ScreenSize.width * 0.14,
                  height: ScreenSize.height * 0.14,
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    children: [
            Icon( Icons.power_settings_new, color: Colors.white, size: 20,),
            Text('Let\'s Connect', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
