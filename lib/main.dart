import 'package:edusakha/dialogs/error_dialog.dart';
import 'package:edusakha/view/login.dart';
import 'package:edusakha/view/selectAccType.dart';
import 'package:edusakha/view/studentHome.dart';
import 'package:edusakha/view/student_register.dart';
import 'package:edusakha/view/universityHome.dart';
import 'package:flutter/material.dart';
import 'package:edusakha/constants/routes.dart';

import 'auth/auth_service.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
          loginRoute: (context) => const LoginView(),
    studentRegisterRoute: (context) => const StudentRegister(),
        uniOrStudent:(context)=>const AccountType(),
        homeRouteUni:(context)=>const HomePageUniversity(),
        homeRouteStudent:(context)=>const HomePageStudent(),
      },
      home: const MyHomePage(title: 'EduSakha'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              //will keep if condition for university
              return const HomePageUniversity();
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
