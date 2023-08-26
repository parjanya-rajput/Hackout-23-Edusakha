import 'videoConference.dart';
import 'package:flutter/material.dart';

class LoginScreenUni extends StatefulWidget {
  const LoginScreenUni({Key? key}) : super(key: key);

  @override
  State<LoginScreenUni> createState() => _LoginScreenUniState();
}

class _LoginScreenUniState extends State<LoginScreenUni> {

  final conferenceId = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    conferenceId.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Conference Window!",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
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
                            'Start',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )

                    ],
                  ),
                )
            ),
          ),
        );
  }
}