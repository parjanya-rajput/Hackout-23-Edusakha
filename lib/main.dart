import 'package:edusakha/view/login.dart';
import 'package:edusakha/view/selectAccType.dart';
import 'package:edusakha/view/student_register.dart';
import 'package:edusakha/view/universityHome.dart';
import 'package:flutter/material.dart';
import 'package:edusakha/constants/routes.dart';
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
        homeRouteUni:(context)=>const HomeUniversity(),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment:  AlignmentDirectional(0, 0),
          child: Text(
            'EduSakha',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,

      ),
      body: const Center(
      ),
    );
  }
}
