import 'package:flutter/material.dart';

class LoadingWidgetUI extends StatelessWidget {
  const LoadingWidgetUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
          SizedBox(
            height: 8,

          ),
          Text('Geither Free VPN Location ...',
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black38),)
        ],
      ),
    );
  }
}