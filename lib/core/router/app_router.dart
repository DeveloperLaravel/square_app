import 'package:go_router/go_router.dart';


import '../../features/presntaion/home/home_page.dart';
import '../../features/presntaion/products/add_product_page.dart';
import '../../features/presntaion/products/domain/product_entity.dart';
import '../../features/presntaion/products/edit_product_screen.dart';
import '../../features/presntaion/products/product_details_screen.dart';
import '../../features/presntaion/products/search_screen.dart';
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
          child: const ProductsScreen(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.productDetails,

      pageBuilder: (
        context,
        state,
      ) {
          final product = state.extra as ProductEntity;
        return PageTransitions.build(
          state: state,
          child:  ProductDetailsScreen(
               product: product,
    ),
        );
      },
    ),

     GoRoute(
      path: AppRoutes.editProduct,

      pageBuilder: (
        context,
        state,
      ) {
          final product = state.extra as ProductEntity;
        return PageTransitions.build(
          state: state,
          child:  EditProductScreen(
               product: product,
    ),
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
    GoRoute(
      path: AppRoutes.addProduct,

      pageBuilder: (
        context,
        state,
      ) {
        return PageTransitions.build(
          state: state,
          child: const AddProductPage(),
        );
      },
    ),
   
  ],
);