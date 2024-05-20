import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/data/Menu.d.dart';
import 'package:flutter_startup/theme/dimensions.dart';
import 'package:flutter_startup/utils/navigator/navigator_compat.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(builder: (context, provider, child) {
      MenuListModel? model = provider.menuModel;
      if (model == null) return const SizedBox();

      var menus = model.menus[provider.currentIndex];
      if (menus.children == null) return const SizedBox();

      return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: defaultPaddingValue),
            itemCount: menus.children!.length,
            itemBuilder: (context, index) {
              MenuItem e = menus.children![index];
              return Consumer<NavigatorCompat>(
                  builder: (context, navigator, child) {
                return ListTile(
                    title: Text(
                      e.title,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    selected: true,
                    selectedColor: Theme.of(context).colorScheme.error,
                    onTap: () {
                      if (e.route?.isNotEmpty ?? false) {
                        // ignore '/' for now
                        if (e.route == '/') return;
                        provider.updateSubSelection(index);
                        navigator.pushNamed(context, e.route!);
                      }
                    });
              });
            }),
      );
    });
  }
}
