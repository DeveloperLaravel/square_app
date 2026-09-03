import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable:
          ThemeManager.instance.themeModeNotifier,

      builder: (
        context,
        themeMode,
        child,
      ) {
        return ValueListenableBuilder<Color>(
          valueListenable:
              ThemeManager.instance.colorNotifier,

          builder: (
            context,
            primaryColor,
            child,
          ) {
            return MaterialApp.router(

              title: 'Page Transitions',

              theme: AppTheme.light(
                primaryColor,
              ),

              darkTheme: AppTheme.dark(
                primaryColor,
              ),

              themeMode: themeMode,

              routerConfig: appRouter,
            );
          },
        );
      },
    );
  }
}