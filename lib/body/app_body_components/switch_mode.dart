import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warm_cloud/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SwitchMode extends StatelessWidget {
  const SwitchMode({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => Padding(
        padding: const EdgeInsets.only(top: 3, bottom: 3, right: 18, left: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Switch Mode"),
            const SizedBox(
              width: 5,
            ),
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value); // Call the toggle function
              },
            ),
          ],
        ),
      ),
    );
  }
}
