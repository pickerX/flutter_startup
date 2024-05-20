import 'package:flutter/material.dart';
import 'package:flutter_startup/app/state/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSetting extends StatefulWidget {
  const ThemeSetting({super.key});

  @override
  State<ThemeSetting> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  int groupValue = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setMode(ThemeMode.system);
                  });
                }),
            const Text("跟随系统")
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setMode(ThemeMode.light);
                  });
                }),
            const Text("日间模式")
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setMode(ThemeMode.dark);
                  });
                }),
            const Text("夜间模式")
          ],
        ),
      ],
    );
  }
}
