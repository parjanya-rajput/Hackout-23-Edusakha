import 'package:edusakha/view/videoConference.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final conferenceId = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    conferenceId.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
                child:Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('Conference',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        height: 70,
                        width: 150,
                        child: TextField(
                          controller: conferenceId,
                          style: const TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => VideoConferencePage(conferenceID: conferenceId.text)));
                          },
                          child: const Text(
                            'start/join',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )

                    ],
                  ),
                )
            ),
          ),
        ));
  }
}