import 'package:flutter/material.dart';

class NoVpnServerFoundedUIWidget extends StatelessWidget {
  const NoVpnServerFoundedUIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
            Text('No VPN Location Founded ...',
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black38),)
      ],
    );
  }
}