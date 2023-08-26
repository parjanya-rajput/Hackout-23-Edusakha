import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../constants/routes.dart';
import '../dialogs/log_out.dart';
import '../enums/menu_action.dart';

class AccountType extends StatefulWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  final db = FirebaseFirestore.instance;
  late final TextEditingController _name;
  late final TextEditingController _username;

  @override
  void initState() {
    _name = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _name.dispose();
    super.dispose();
  }

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
      body: Column(
        children: [
          TextField(
            controller: _username,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Enter your Username",
            ),
          ),
          TextField(
            controller: _name,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Enter your University Name",
            ),
          ),
          TextButton(
              onPressed: () async {
                final username = <String, String>{"username": _name.text};
              //   await db
              //       .collection('students')
              //       .doc("Name")
              //       .set(username)
              //       .onError((e, _) => print("Error writing document: $e"));
                Navigator.pushNamedAndRemoveUntil(
                    context, homeRouteStudent, (route) => false);
              },
              child: const Text("Register as a Student")),
          TextButton(
              onPressed: () async {
                final username = <String, String>{"username": _name.text};
                // await db
                //     .collection('university')
                //     .doc("Name")
                //     .set(username)
                //     .onError((e, _) => print("Error writing document: $e"));
                Navigator.pushNamedAndRemoveUntil(
                    context, homeRouteUni, (route) => false);
              },
              child: const Text("Register as a University"))
        ],
      ),
    );
  }
}
