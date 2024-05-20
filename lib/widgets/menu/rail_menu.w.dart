import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/data/menu.data.dart';
import 'package:flutter_startup/theme/dimensions.dart';
import 'package:flutter_startup/utils/navigator/navigator_compat.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavRailMenu extends StatefulWidget {
  final String configAsset;

  const NavRailMenu({super.key, required this.configAsset});

  @override
  State<NavRailMenu> createState() => _NavRailMenuState();
}

class _NavRailMenuState extends State<NavRailMenu> {
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;
  bool showLeading = false;
  bool showTrailing = true;
  double groupAlignment = -1.0;

  _NavRailMenuState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadStructuredData(widget.configAsset, (value) {
          Map<String, dynamic> config = jsonDecode(value);
          return Future.value(MenuListModel.fromJson(config));
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Consumer<MenuProvider>(builder: (context, provider, child) {
            var source = snapshot.data!.menus;
            provider.cacheMenuModel(snapshot.data!);

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

            return Container(
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: defaultPaddingValue),
                  Expanded(
                    child: Consumer<NavigatorCompat>(
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
                          leading: showLeading
                              ? FloatingActionButton(
                                  elevation: 0,
                                  onPressed: () {
                                    // Add your onPressed code here!
                                  },
                                  child: const Icon(Icons.add),
                                )
                              : const SizedBox(),
                          trailing: showTrailing
                              ? IconButton(
                                  onPressed: () {
                                    // more functions
                                  },
                                  icon: const Icon(Icons.more_horiz),
                                )
                              : const SizedBox(),
                          destinations: destinations,
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // change theme: dark or light
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                  ),
                  const SizedBox(height: defaultPaddingValue),
                ],
              ),
            );
          });
        });
  }
}
