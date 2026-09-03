import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'transition_manager.dart';
import 'transition_type.dart';

class PageTransitions {
  static CustomTransitionPage build({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,

      transitionDuration: const Duration(
        milliseconds: 400,
      ),

      reverseTransitionDuration:
          const Duration(
        milliseconds: 300,
      ),

      child: child,

      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        final type =
            TransitionManager.instance.current;

        switch (type) {
          // ==========================================
          // Fade
          // ==========================================

          case TransitionType.fade:
            return FadeTransition(
              opacity: animation,
              child: child,
            );

          // ==========================================
          // Slide Right
          // ==========================================

          case TransitionType.slideRight:
            return _slide(
              animation: animation,
              child: child,
              begin: const Offset(1, 0),
            );

          // ==========================================
          // Slide Left
          // ==========================================

          case TransitionType.slideLeft:
            return _slide(
              animation: animation,
              child: child,
              begin: const Offset(-1, 0),
            );

          // ==========================================
          // Slide Bottom
          // ==========================================

          case TransitionType.slideBottom:
            return _slide(
              animation: animation,
              child: child,
              begin: const Offset(0, 1),
            );

          // ==========================================
          // Slide Top
          // ==========================================

          case TransitionType.slideTop:
            return _slide(
              animation: animation,
              child: child,
              begin: const Offset(0, -1),
            );

          // ==========================================
          // Scale
          // ==========================================

          case TransitionType.scale:
            final scaleAnimation =
                Tween<double>(
              begin: 0.7,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            );

            return ScaleTransition(
              scale: scaleAnimation,
              child: child,
            );

          // ==========================================
          // Rotation
          // ==========================================

          case TransitionType.rotation:
            final rotationAnimation =
                Tween<double>(
              begin: 0.5,
              end: 0.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            );

            return RotationTransition(
              turns: rotationAnimation,
              child: child,
            );

          // ==========================================
          // Fade + Slide
          // ==========================================

          case TransitionType.fadeSlide:
            final curvedAnimation =
                CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );

            final slideAnimation =
                Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(
              curvedAnimation,
            );

            return FadeTransition(
              opacity: curvedAnimation,

              child: SlideTransition(
                position: slideAnimation,
                child: child,
              ),
            );
        }
      },
    );
  }

  // ================================================
  // Slide Helper
  // ================================================

  static Widget _slide({
    required Animation<double> animation,
    required Widget child,
    required Offset begin,
  }) {
    final positionAnimation =
        Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      ),
    );

    return SlideTransition(
      position: positionAnimation,
      child: child,
    );
  }
}