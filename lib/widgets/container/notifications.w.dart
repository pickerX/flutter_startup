import 'package:flutter/material.dart';
import 'package:flutter_startup/theme/dimensions.dart';

class NotifyContainer extends StatelessWidget {
  const NotifyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DefaultPadding,
      color: Theme.of(context).colorScheme.background,
      child: Expanded(
        child: Column(
          children: [
            Text("info container"),
          ],
        ),
      ),
    );
  }
}
