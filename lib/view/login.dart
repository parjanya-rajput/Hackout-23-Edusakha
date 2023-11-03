import 'package:edusakha/constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:edusakha/dialogs/error_dialog.dart';
import '../auth/auth_exceptions.dart';
import '../auth/auth_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffb666d2),
                  Color(0xff281537),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Hello\nLog in!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                    ),),
                      const SizedBox(height: 20,),

                      TextField(
                        controller: _password,
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                        ),
                      ),
                      const SizedBox(height: 20,),

                      const SizedBox(height: 70,),
                      TextButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color(0xffb666d2)),

                        ),
                        onPressed: () async {
                          await Firebase.initializeApp();
                          try {
                            final email = _email.text;
                            final password = _password.text;
                            await AuthService.firebase().logIn(
                              email: email,
                              password: password,
                            );
                            final user = AuthService
                                .firebase()
                                .currentUser;
                            if (user?.isEmailVerified ?? false) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                uniOrStudent,
                                    (route) => false,
                              );
                            } else {
                              await showErrorDialog(context,'Please Verify your Email!');
                            }
                          } on UserNotFoundAuthException {
                            await showErrorDialog(context,
                                'User Not Found'
                            );
                          } on WrongPasswordAuthException {
                            await showErrorDialog(
                              context,
                              'Wrong Credentials',
                            );
                          } on GenericAuthException {
                            await showErrorDialog(
                              context,
                              'Authentication Error',
                            );
                          }
                        },
                        child: const Text('Log In',
                        style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 150,),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, studentRegisterRoute, (route) => false);
                          },
                          child: const Text("Not Registered yet? Register Now!")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
