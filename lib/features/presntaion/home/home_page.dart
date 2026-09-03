import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/theme_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context);

    final primary =
        theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الرئيسية',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            tooltip: 'الإعدادات',
            onPressed: () {
              context.push(
                AppRoutes.settings,
              );
            },
            icon: const Icon(
              Icons.settings_outlined,
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      body: ListView(
        padding:
            const EdgeInsets.all(20),

        children: [

          // ==================================================
          // Welcome Card
          // ==================================================

          _WelcomeCard(
            primaryColor: primary,
          ),

          const SizedBox(height: 30),

          const Text(
            'الوصول السريع',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // ==================================================
          // Products
          // ==================================================

          _HomeCard(
            title: 'المنتجات',
            subtitle:
                'عرض وإدارة المنتجات',
            icon: Icons.shopping_bag_outlined,
            color: primary,

            onTap: () {
              context.push(
                AppRoutes.products,
              );
            },
          ),

          const SizedBox(height: 14),

          // ==================================================
          // Profile
          // ==================================================

          _HomeCard(
            title: 'الملف الشخصي',
            subtitle:
                'عرض معلومات الحساب',
            icon: Icons.person_outline,
            color: Colors.green,

            onTap: () {
              context.push(
                AppRoutes.profile,
              );
            },
          ),

          const SizedBox(height: 14),

          // ==================================================
          // Settings
          // ==================================================

          _HomeCard(
            title: 'الإعدادات',
            subtitle:
                'المظهر والألوان وحركة الصفحات',
            icon: Icons.settings_outlined,
            color: Colors.orange,

            onTap: () {
              context.push(
                AppRoutes.settings,
              );
            },
          ),

          const SizedBox(height: 30),

          // ==================================================
          // Current Theme
          // ==================================================

          ListenableBuilder(
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

              return Card(
                elevation: 0,

                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,

                    decoration: BoxDecoration(
                      color: manager
                          .primaryColor
                          .withValues(
                            alpha: 0.12,
                          ),
                      shape:
                          BoxShape.circle,
                    ),

                    child: Icon(
                      Icons.palette_outlined,
                      color:
                          manager.primaryColor,
                    ),
                  ),

                  title: const Text(
                    'تخصيص التطبيق',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  subtitle: const Text(
                    'يمكنك تغيير المظهر واللون والحركة من الإعدادات',
                  ),

                  trailing:
                      const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),

                  onTap: () {
                    context.push(
                      AppRoutes.settings,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Welcome Card
// ============================================================

class _WelcomeCard
    extends StatelessWidget {

  final Color primaryColor;

  const _WelcomeCard({
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:
          const EdgeInsets.all(24),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            primaryColor,
            primaryColor.withValues(
              alpha: 0.65,
            ),
          ],
        ),

        borderRadius:
            BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(
            color: primaryColor
                .withValues(
                  alpha: 0.25,
                ),

            blurRadius: 25,

            offset:
                const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 64,
            height: 64,

            decoration: BoxDecoration(
              color: Colors.white
                  .withValues(
                    alpha: 0.20,
                  ),

              shape:
                  BoxShape.circle,
            ),

            child: const Icon(
              Icons.dashboard_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),

          const SizedBox(width: 18),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  'مرحباً بك 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'تحكم في التطبيق وخصصه كما تريد',
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
// Home Card
// ============================================================

class _HomeCard
    extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _HomeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 0,

      margin: EdgeInsets.zero,

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20),

        side: BorderSide(
          color: Theme.of(context)
              .dividerColor
              .withValues(
                alpha: 0.5,
              ),
        ),
      ),

      child: InkWell(
        borderRadius:
            BorderRadius.circular(20),

        onTap: onTap,

        child: Padding(
          padding:
              const EdgeInsets.all(18),

          child: Row(
            children: [

              Container(
                width: 55,
                height: 55,

                decoration: BoxDecoration(
                  color: color.withValues(
                    alpha: 0.12,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    16,
                  ),
                ),

                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,
                      style:
                          const TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      style:
                          TextStyle(
                        color: Theme.of(
                          context,
                        )
                            .textTheme
                            .bodySmall
                            ?.color,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.arrow_forward_ios,
                size: 17,
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
