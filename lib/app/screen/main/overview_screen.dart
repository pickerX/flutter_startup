import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_startup/app/widgets/container/dashboard_header.dart";
import "package:flutter_startup/res/dimensions.dart";

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
          Text("Here is an overview of your code performance",
              style: Theme.of(context).textTheme.titleMedium),
        ],
      )
    ]);
  }

  Widget _render(BuildContext context) {
    return SizedBox(
      height: 360,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 5,
            crossAxisSpacing: defaultPaddingValue,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                axisAlignment: -1.0,
                // Wrap the ListTile in a Material widget so the ListTile has someplace
                // to draw the animated colors during the size transition.
                child: const Material(
                  child: ListTile(
                    title: Text('ListTile with SizeTransition'),
                    // tileColor: Colors.red,
                    minVerticalPadding: 25.0,
                  ),
                ),
              ),
            );
          }),
    );
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
