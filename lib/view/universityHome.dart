import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../constants/routes.dart';
import '../dialogs/log_out.dart';
import '../enums/menu_action.dart';

class HomeUniversity extends StatefulWidget {
  const HomeUniversity({Key? key}) : super(key: key);

  @override
  State<HomeUniversity> createState() => _HomeUniversityState();
}

class _HomeUniversityState extends State<HomeUniversity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduSakha'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await AuthService.firebase().logOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                        (route) => false,
                  );
                }
            }
          }, itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                  value: MenuAction.logout, child: Text('Log Out')),
            ];
          })
        ],
      ),
    );
  }
}
