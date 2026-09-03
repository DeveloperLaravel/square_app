import 'package:go_router/go_router.dart';


import '../../features/presntaion/home/home_page.dart';
import '../../features/presntaion/products/products_page.dart';
import '../../features/presntaion/profile/profile_page.dart';
import '../../features/presntaion/settings/settings_page.dart';
import 'app_routes.dart';
import 'page_transitions.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,

  routes: [

    // ================================================
    // Home
    // ================================================

    GoRoute(
      path: AppRoutes.home,

      builder: (
        context,
        state,
      ) {
        return const HomePage();
      },
    ),

    // ================================================
    // Products
    // ================================================

    GoRoute(
      path: AppRoutes.products,

      pageBuilder: (
        context,
        state,
      ) {
        return PageTransitions.build(
          state: state,
          child: const ProductsPage(),
        );
      },
    ),

    // ================================================
    // Settings
    // ================================================

    GoRoute(
      path: AppRoutes.settings,

      pageBuilder: (
        context,
        state,
      ) {
        return PageTransitions.build(
          state: state,
          child: const SettingsPage(),
        );
      },
    ),

    // ================================================
    // Profile
    // ================================================

    GoRoute(
      path: AppRoutes.profile,

      pageBuilder: (
        context,
        state,
      ) {
        return PageTransitions.build(
          state: state,
          child: const ProfilePage(),
        );
      },
    ),

    // ================================================
    // Transition Settings
    // ================================================

   
  ],
);