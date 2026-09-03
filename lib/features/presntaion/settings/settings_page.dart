import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/transition_manager.dart';
import '../../../core/router/transition_type.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإعدادات',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListenableBuilder(
        listenable: Listenable.merge([
          ThemeManager.instance.themeModeNotifier,
          ThemeManager.instance.colorNotifier,
          TransitionManager.instance.transitionNotifier,
        ]),
        builder: (
          context,
          child,
        ) {
          final themeManager = ThemeManager.instance;
          final transitionManager =
              TransitionManager.instance;

          return ListView(
            padding: const EdgeInsets.all(20),

            children: [

              // ==================================================
              // Header
              // ==================================================

              _SettingsHeader(
                primaryColor:
                    themeManager.primaryColor,
              ),

              const SizedBox(height: 25),

              // ==================================================
              // Appearance
              // ==================================================

              const _SectionTitle(
                title: 'مظهر التطبيق',
                icon: Icons.palette_outlined,
              ),

              const SizedBox(height: 12),

              _SettingsCard(
                child: Column(
                  children: [

                    _ThemeModeTile(
                      title: 'الوضع النهاري',
                      subtitle:
                          'استخدام المظهر الفاتح',
                      icon: Icons.light_mode_outlined,
                      mode: ThemeMode.light,
                      selected:
                          themeManager.themeMode ==
                              ThemeMode.light,
                    ),

                    const Divider(height: 1),

                    _ThemeModeTile(
                      title: 'الوضع الليلي',
                      subtitle:
                          'استخدام المظهر الداكن',
                      icon: Icons.dark_mode_outlined,
                      mode: ThemeMode.dark,
                      selected:
                          themeManager.themeMode ==
                              ThemeMode.dark,
                    ),

                    const Divider(height: 1),

                    _ThemeModeTile(
                      title: 'حسب النظام',
                      subtitle:
                          'اتبع إعداد الجهاز',
                      icon: Icons.phone_android_outlined,
                      mode: ThemeMode.system,
                      selected:
                          themeManager.themeMode ==
                              ThemeMode.system,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // Colors
              // ==================================================

              const _SectionTitle(
                title: 'لون التطبيق',
                icon: Icons.color_lens_outlined,
              ),

              const SizedBox(height: 12),

              _SettingsCard(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'اختر اللون الأساسي للتطبيق',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 18),

                    const SizedBox(height: 30),

// ==================================================
// Colors
// ==================================================

const _SectionTitle(
  title: 'لون التطبيق',
  icon: Icons.color_lens_outlined,
),

const SizedBox(height: 12),

_SettingsCard(
  child: Padding(
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'اختر اللون الأساسي للتطبيق',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            _ColorButton(
              color: AppColors.blue,
              selectedColor:
                  themeManager.primaryColor,
            ),

            _ColorButton(
              color: AppColors.green,
              selectedColor:
                  themeManager.primaryColor,
            ),

            _ColorButton(
              color: AppColors.orange,
              selectedColor:
                  themeManager.primaryColor,
            ),

            _ColorButton(
              color: AppColors.red,
              selectedColor:
                  themeManager.primaryColor,
            ),

            _ColorButton(
              color: AppColors.purple,
              selectedColor:
                  themeManager.primaryColor,
            ),
          ],
        ),
      ],
    ),
  ),
),

const SizedBox(height: 30),

// ==================================================
// Page Transitions
// ==================================================

const _SectionTitle(
  title: 'حركة الصفحات',
  icon: Icons.animation_outlined,
),

const SizedBox(height: 12),

_SettingsCard(
  child: Column(
    children: [
      _TransitionTile(
        title: 'Fade',
        subtitle: 'ظهور الصفحة تدريجيًا',
        icon: Icons.blur_on,
        type: TransitionType.fade,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Slide Right',
        subtitle: 'دخول الصفحة من اليمين',
        icon: Icons.arrow_forward,
        type: TransitionType.slideRight,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Slide Left',
        subtitle: 'دخول الصفحة من اليسار',
        icon: Icons.arrow_back,
        type: TransitionType.slideLeft,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Slide Bottom',
        subtitle: 'دخول الصفحة من الأسفل',
        icon: Icons.arrow_upward,
        type: TransitionType.slideBottom,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Slide Top',
        subtitle: 'دخول الصفحة من الأعلى',
        icon: Icons.arrow_downward,
        type: TransitionType.slideTop,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Scale',
        subtitle: 'تكبير الصفحة تدريجيًا',
        icon: Icons.zoom_in,
        type: TransitionType.scale,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Rotation',
        subtitle: 'دوران الصفحة عند الدخول',
        icon: Icons.rotate_right,
        type: TransitionType.rotation,
        selected: transitionManager.current,
      ),

      const Divider(height: 1),

      _TransitionTile(
        title: 'Fade + Slide',
        subtitle: 'تلاشي مع حركة جانبية',
        icon: Icons.auto_awesome,
        type: TransitionType.fadeSlide,
        selected: transitionManager.current,
      ),
    ],
  ),
),

const SizedBox(height: 30),
                    ],
                  ),
                ),
                ),

              const SizedBox(height: 30),

              // ==================================================
              // Page Transitions
              // ==================================================

              const _SectionTitle(
                title: 'حركة الصفحات',
                icon: Icons.animation_outlined,
              ),

              const SizedBox(height: 12),

            _SettingsCard(
  child: Padding(
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'اختر اللون الأساسي للتطبيق',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Slide Right',
                      subtitle:
                          'دخول الصفحة من اليمين',
                      icon: Icons.arrow_forward,
                      type:
                          TransitionType.slideRight,
                      selected:
                          transitionManager.current,
                    ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Slide Left',
                      subtitle:
                          'دخول الصفحة من اليسار',
                      icon: Icons.arrow_back,
                      type:
                          TransitionType.slideLeft,
                      selected:
                          transitionManager.current,
                    ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Slide Bottom',
                      subtitle:
                          'دخول الصفحة من الأسفل',
                      icon: Icons.arrow_upward,
                      type:
                          TransitionType.slideBottom,
                      selected:
                          transitionManager.current,
                    ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Slide Top',
                      subtitle:
                          'دخول الصفحة من الأعلى',
                      icon: Icons.arrow_downward,
                      type:
                          TransitionType.slideTop,
                      selected:
                          transitionManager.current,
                    ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Scale',
                      subtitle:
                          'تكبير الصفحة تدريجيًا',
                      icon: Icons.zoom_in,
                      type: TransitionType.scale,
                      selected:
                          transitionManager.current,
                    ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Rotation',
                      subtitle:
                          'دوران الصفحة عند الدخول',
                      icon: Icons.rotate_right,
                      type:
                          TransitionType.rotation,
                      selected:
                          transitionManager.current,
                    ),

                    const Divider(height: 1),

                    _TransitionTile(
                      title: 'Fade + Slide',
                      subtitle:
                          'تلاشي مع حركة جانبية',
                      icon: Icons.auto_awesome,
                      type:
                          TransitionType.fadeSlide,
                      selected:
                          transitionManager.current,
                    ),
                  ],
                ),
              ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // Back
              // ==================================================

              SizedBox(
                height: 52,
                child: FilledButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  label: const Text(
                    'رجوع',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

// ============================================================
// Header
// ============================================================

class _SettingsHeader extends StatelessWidget {
  final Color primaryColor;

  const _SettingsHeader({
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            primaryColor.withValues(alpha: 0.7),
          ],
        ),
        borderRadius:
            BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color:
                primaryColor.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 58,
            height: 58,

            decoration: BoxDecoration(
              color: Colors.white
                  .withValues(alpha: 0.20),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  'الإعدادات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'خصص التطبيق بالطريقة التي تناسبك',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Section Title
// ============================================================

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        Theme.of(context).colorScheme.primary;

    return Row(
      children: [

        Icon(
          icon,
          color: color,
          size: 24,
        ),

        const SizedBox(width: 10),

        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// Settings Card
// ============================================================

class _SettingsCard extends StatelessWidget {
  final Widget child;

  const _SettingsCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20),

        side: BorderSide(
          color: Theme.of(context)
              .dividerColor
              .withValues(alpha: 0.5),
        ),
      ),

      clipBehavior: Clip.antiAlias,

      child: child,
    );
  }
}

// ============================================================
// Theme Mode Tile
// ============================================================

class _ThemeModeTile
    extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode mode;
  final bool selected;

  const _ThemeModeTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.mode,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final primary =
        Theme.of(context)
            .colorScheme
            .primary;

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 6,
      ),

      leading: Container(
        width: 46,
        height: 46,

        decoration: BoxDecoration(
          color: selected
              ? primary.withValues(
                  alpha: 0.12,
                )
              : Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest,

          borderRadius:
              BorderRadius.circular(14),
        ),

        child: Icon(
          icon,
          color: selected
              ? primary
              : null,
        ),
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),

      subtitle: Text(
        subtitle,
      ),

      trailing: AnimatedContainer(
        duration:
            const Duration(milliseconds: 250),

        width: 25,
        height: 25,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected
              ? primary
              : Colors.transparent,

          border: Border.all(
            color: selected
                ? primary
                : Theme.of(context)
                    .dividerColor,
            width: 2,
          ),
        ),

        child: selected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 17,
              )
            : null,
      ),

      onTap: () {
        ThemeManager.instance
            .changeThemeMode(mode);
      },
    );
  }
}

// ============================================================
// Color Button
// ============================================================

class _ColorButton
    extends StatelessWidget {

  final Color color;
  final Color selectedColor;

  const _ColorButton({
    required this.color,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {

    final selected =
        color.toARGB32() ==
            selectedColor.toARGB32();

    return GestureDetector(
      onTap: () {
        ThemeManager.instance
            .changeColor(color);
      },

      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 250),

        width: 56,
        height: 56,

        padding: const EdgeInsets.all(4),

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          border: selected
              ? Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface,
                  width: 3,
                )
              : null,
        ),

        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color:
                    color.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: selected
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}

// ============================================================
// Transition Tile
// ============================================================

class _TransitionTile
    extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;
  final TransitionType type;
  final TransitionType selected;

  const _TransitionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.type,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {

    final isSelected =
        selected == type;

    final primary =
        Theme.of(context)
            .colorScheme
            .primary;

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 6,
      ),

      leading: Container(
        width: 46,
        height: 46,

        decoration: BoxDecoration(
          color: isSelected
              ? primary.withValues(
                  alpha: 0.12,
                )
              : Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest,

          borderRadius:
              BorderRadius.circular(14),
        ),

        child: Icon(
          icon,
          color:
              isSelected ? primary : null,
        ),
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),

      subtitle: Text(
        subtitle,
      ),

      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: primary,
            )
          : const Icon(
              Icons.circle_outlined,
            ),

      onTap: () {
        TransitionManager.instance
            .changeTransition(type);
      },
    );
  }
}
