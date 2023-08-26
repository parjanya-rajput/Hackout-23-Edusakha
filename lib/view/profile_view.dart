import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../constants/routes.dart';
import '../dialogs/log_out.dart';
import 'studentHome.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){ Navigator. push(context, MaterialPageRoute(builder: (context) => HomePageStudent()));
          },
          icon:Icon(Icons. arrow_back_ios),
        ),
        title: Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'student', Icons.person),
            const SizedBox(height: 10),
            itemProfile('Email', 'student@gmail.com', Icons.email),
            const SizedBox(height: 10),
            itemProfile('Password', '********', Icons.remove_red_eye),
            const SizedBox(height: 10),
            itemProfile('University', 'University', Icons.school),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                            (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Log Out')
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}