import 'package:flutter/material.dart';
import 'package:flutter_startup/pages/setting/components/settinig_title.dart';

class SettingPanel extends StatelessWidget {
  const SettingPanel({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTitle(title),
        const SizedBox(
          height: 10,
        ),
        child
      ],
    );
  }
}
