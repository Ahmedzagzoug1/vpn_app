import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiVpnGate {
static Future<void> retrieveAllAvailableVpnFreeSevers() async {
  //https://www.vpngate.net/api/iphone/
 try{

  }catch(errorMessage){
Get.snackbar('Error Message', errorMessage.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white.withOpacity(.8),);
  }

  
}
 
}
