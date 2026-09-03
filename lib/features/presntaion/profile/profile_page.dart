import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.person,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Profile Page',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(
                'رجوع',
              ),
            ),
          ],
        ),
      ),
    );
  }
}