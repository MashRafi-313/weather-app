import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMode extends StatelessWidget{
  final VoidCallback toggleMode;
  SwitchMode({
    required this.toggleMode,
  });

  Widget build(BuildContext context){
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3,right: 18,left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Switch Mode"),
          const SizedBox(width: 5,),
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              toggleMode(); // Call the toggle function
            },
          ),
        ],
      ),
    );
  }


}