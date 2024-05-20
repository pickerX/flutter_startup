import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/widgets/container/dash_container.w.dart';
import 'package:flutter_startup/widgets/container/dashboard.w.dart';
import 'package:flutter_startup/widgets/menu/rail_menu.w.dart';
import 'package:flutter_startup/widgets/menu/side_menu.w.dart';
import 'package:flutter_startup/widgets/responsive.w.dart';

import 'package:flutter/material.dart';
import 'package:flutter_startup/config/config.g.dart';
import 'package:flutter_startup/config/router.g.dart';
import 'package:provider/provider.dart';

import '../setting/setting.page.dart';

/// dynamic menu + dashboard
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuProvider>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavRailMenu(configAsset: GlobalConfig.defaultMenuConfig),
            // default flex = 1 and it takes 1/6 part of the screen
            Consumer<MenuProvider>(builder: (context, value, child) {
              if (Responsive.isDesktop(context)) {
                return const Expanded(child: SideMenu());
              } else {
                return const SizedBox();
              }
            }),

            // It takes 5/6 part of the screen
            Expanded(
              flex: 6,
              child: Dashboard(routerTable: routerTable),
            ),
          ],
        ),
      ),
    );
  }
}
