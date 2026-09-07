import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:square_app/features/freeze_products/domain/product_entity.dart';
import 'package:square_app/features/products/domain/product.dart';
import 'package:square_app/features/products/presntaion/products.dart';

import '../../features/freeze_products/presntaion/add_product_page.dart';
import '../../features/freeze_products/presntaion/product_details_page.dart';
import '../../features/freeze_products/presntaion/products_screen.dart';
import '../../features/presntaion/home/home_page.dart';
import '../../features/products/presntaion/add_product_page.dart';
import '../../features/products/presntaion/bloc/products_bloc.dart';
import '../../features/products/presntaion/bloc/products_event.dart' hide AddProduct;
import '../../features/products/presntaion/edit_product_screen.dart';
import '../../features/products/presntaion/product_details_screen.dart';
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
          child: BlocProvider(
        create: (_) => ProductsBloc() ..add(
          const ProductsEvent.load(),
        ),
        child: const Products(),
      ),
        );
      },
    ),
        GoRoute(
      path: AppRoutes.productsFreeze,

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
          final product = state.extra as Product;
        return PageTransitions.build(
          state: state,
          child:  ProductDetailsScreen(
               product: product,
    ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.productDetailsFreeze,

      pageBuilder: (
        context,
        state,
      ) {
          final product = state.extra as ProductEntity;
        return PageTransitions.build(
          state: state,
          child:  ProductDetailsPage(
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
          final product = state.extra as Product;
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
          child: const AddProduct(),
        );
      },
    ),
     GoRoute(
      path: AppRoutes.addProductFreeze,

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