import 'package:flutter/material.dart';
import 'package:flutter_startup/app/state/menu_provider.dart';
import 'package:flutter_startup/app/state/theme_provider.dart';
import 'package:flutter_startup/config/GlobalConfig.dart';
import 'package:flutter_startup/config/AppRouter.dart';
import 'package:flutter_startup/theme/theme.dart';
import 'package:flutter_startup/utils/navigator/navigator_compat.dart';
import 'package:flutter_startup/utils/utilities.dart';
import 'package:provider/provider.dart';

void main() {
  if (isDesktop()) {
    resizePCWindow(
        width: GlobalConfig.defaultWindowSize.width,
        height: GlobalConfig.defaultWindowSize.height);
  }

  runApp(const Launcher());
}

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuProvider()),
          ChangeNotifierProvider(create: (context) => NavigatorCompat()),
          ChangeNotifierProvider(create: (conttext) => ThemeProvider())
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeController, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: AppRouter.get(),
              title: '开发者工具',
              themeMode: themeController.themeMode,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.dartTheme(),
            );
          },
        ));
  }
}
