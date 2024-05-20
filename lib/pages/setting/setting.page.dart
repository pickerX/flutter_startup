import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter/src/widgets/framework.dart";
import "package:flutter_startup/pages/setting/components/setting_panel.dart";
import "package:flutter_startup/pages/setting/components/settinig_title.dart";
import "package:flutter_startup/pages/setting/components/theme_setting.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('build setting page');
    return Center(
      child: Column(
        children: const [SettingPanel(title: "主题设置", child: ThemeSetting())],
      ),
    );
  }
}
