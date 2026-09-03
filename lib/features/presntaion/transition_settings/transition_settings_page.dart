import 'package:flutter/material.dart';

import '../../../core/router/transition_manager.dart';
import '../../../core/router/transition_type.dart';


class TransitionSettingsPage
    extends StatelessWidget {
  const TransitionSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حركة الصفحات',
        ),
      ),

      body: ValueListenableBuilder<
          TransitionType>(
        valueListenable:
            TransitionManager
                .instance
                .transitionNotifier,

        builder: (
          context,
          selected,
          child,
        ) {
          return ListView(
            padding: const EdgeInsets.all(20),

            children: [

              const Text(
                'اختر حركة الانتقال',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'الحركة التي تختارها سيتم استخدامها عند فتح الصفحات.',
              ),

              const SizedBox(height: 25),

              _TransitionTile(
                title: 'Fade',
                type: TransitionType.fade,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Slide Right',
                type: TransitionType.slideRight,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Slide Left',
                type: TransitionType.slideLeft,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Slide Bottom',
                type: TransitionType.slideBottom,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Slide Top',
                type: TransitionType.slideTop,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Scale',
                type: TransitionType.scale,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Rotation',
                type: TransitionType.rotation,
                selected: selected,
              ),

              _TransitionTile(
                title: 'Fade + Slide',
                type: TransitionType.fadeSlide,
                selected: selected,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TransitionTile
    extends StatelessWidget {
  final String title;
  final TransitionType type;
  final TransitionType selected;

  const _TransitionTile({
    required this.title,
    required this.type,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected =
        selected == type;

    return Card(
      child: ListTile(
        title: Text(title),

        trailing: isSelected
            ? const Icon(
                Icons.check_circle,
              )
            : const Icon(
                Icons.circle_outlined,
              ),

        onTap: () {
          TransitionManager
              .instance
              .changeTransition(type);
        },
      ),
    );
  }
}