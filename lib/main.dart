import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        ThemeManager.instance
            .themeModeNotifier,

        ThemeManager.instance
            .colorNotifier,
      ]),

      builder: (
        context,
        child,
      ) {
        final manager =
            ThemeManager.instance;

        return MaterialApp.router(
          debugShowCheckedModeBanner:
              false,

          title:
              'My App',

          theme:
              AppTheme.light(
            manager.primaryColor,
          ),

          darkTheme:
              AppTheme.dark(
            manager.primaryColor,
          ),

          themeMode:
              manager.themeMode,

          routerConfig:
              appRouter,
        );
      },
    );
  }
}