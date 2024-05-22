import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_startup/app/state/theme_provider.dart';
import 'package:flutter_startup/widgets/menu/menu_provider.dart';
import 'package:flutter_startup/widgets/menu/model/menu.d.dart';
import 'package:flutter_startup/theme/dimensions.dart';
import 'package:flutter_startup/utils/navigator/navigator_compat.dart';
import 'package:flutter_startup/widgets/menu/model/menu_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavRailMenu extends StatefulWidget {
  final String jsonAsset;

  const NavRailMenu({super.key, required this.jsonAsset});

  @override
  State<NavRailMenu> createState() => _NavRailMenuState();
}

class _NavRailMenuState extends State<NavRailMenu> {
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;
  bool showLeading = true;
  bool showTrailing = true;
  double groupAlignment = -1.0;

  _NavRailMenuState();

  Widget leadingIcon() => showLeading
      ? FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
        )
      : const SizedBox();

  Widget trailingIcon() => showTrailing
      ? Consumer<ThemeProvider>(
          builder: (context, provider, child) => IconButton(
            onPressed: () => provider.changeMode(),
            icon: Icon(provider.isDark() ? Icons.light_mode : Icons.dark_mode),
          ),
        )
      : const SizedBox();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MenuLoader.load(context, widget.jsonAsset),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Consumer<MenuProvider>(builder: (context, provider, child) {
            var source = snapshot.data!.menus;

            List<NavigationRailDestination> destinations = [
              ...source
                  .map((menu) => NavigationRailDestination(
                        icon: SvgPicture.asset(
                          menu.icon ?? '',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimaryContainer,
                            BlendMode.srcIn,
                          ),
                          height: Theme.of(context).iconTheme.size,
                        ),
                        // selectedIcon: Icon(Icons.favorite),
                        label: Text(menu.title),
                      ))
                  .toList()
            ];

            return Consumer<NavigatorCompat>(
              builder: (context, navigator, child) {
                return NavigationRail(
                  minWidth: 96,
                  selectedIndex: provider.currentIndex,
                  groupAlignment: groupAlignment,
                  onDestinationSelected: (index) {
                    provider.updateSelection(index);
                    // navigate to root menu route
                    var routeName = provider.getRootMenuRoute(index);
                    if (routeName?.isNotEmpty ?? false) {
                      navigator.pushNamed(context, routeName!);
                    }
                  },
                  labelType: labelType,
                  leading: leadingIcon(),
                  trailing: trailingIcon(),
                  destinations: destinations,
                );
              },
            );
          });
        });
  }
}
