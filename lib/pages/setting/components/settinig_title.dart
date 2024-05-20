import 'package:flutter/material.dart';

class SettingTitle extends StatelessWidget {
  final String title;

  const SettingTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(title)],
    );
  }
}
