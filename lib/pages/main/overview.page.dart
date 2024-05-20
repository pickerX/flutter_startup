import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_startup/widgets/container/dashboard_header.w.dart";
import "package:flutter_startup/theme/dimensions.dart";

/// Overview 介绍页
class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<StatefulWidget> createState() => OverviewState();
}

class OverviewState extends State<OverviewScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward().then((value) => _sizeController.stop());

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  Widget _renderHeader(BuildContext context) {
    const avatarURI =
        'https://images.unsplash.com/photo-1687442723936-f9e1457ff1e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60';

    return Row(children: [
      if (avatarURI.isEmpty)
        CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          radius: 50,
          child: const Text('AH'),
        )
      else
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(avatarURI),
        ),
      const SizedBox(width: defaultPaddingValue),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good afternoon,',
              style: Theme.of(context).textTheme.displayMedium),
          Text('haha', style: Theme.of(context).textTheme.titleMedium),
        ],
      )
    ]);
  }

  Widget _render(BuildContext context) {
    return const Text('add your favorite tools here');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderHeader(context),
        const SizedBox(height: defaultPaddingValue),
        _render(context),
      ],
    );
  }
}
