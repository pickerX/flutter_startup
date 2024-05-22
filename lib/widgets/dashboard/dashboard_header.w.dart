import 'package:flutter/material.dart';

/// dashboard header
class DashboardHeader extends StatelessWidget {
  final String title;
  const DashboardHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        Text('sub title', style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
