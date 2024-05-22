import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

/**
 * 基础 container
 */
class XContainer extends StatelessWidget {
  const XContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: child,
    );
  }
}
