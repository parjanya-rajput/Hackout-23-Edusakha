import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusakha/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/events.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({Key? key}) : super(key: key);

  @override
  State<HomePageStudent> createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome!",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_3_outlined),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  profileRoute, (route) => false);
            },

          )
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventHeader(),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('university')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(); // Loading indicator
                    }

                    List<Event> firestoreDataList = snapshot.data!.docs.map((
                        doc) {
                      Map<String, dynamic> data = doc.data() as Map<
                          String,
                          dynamic>;
                      return Event(
                        eventName: data['event_name'],
                        eventDate: data['event_date'],
                        eventTime: data['event_time'],
                        eventDescription: data['event_description'],
                      );
                    }).toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: firestoreDataList.length,
                      itemBuilder: (context, index) {
                        Event data = firestoreDataList[index];
                        return ListTile(
                          title: Text(data.eventName),
                          subtitle: Text(data.eventDate),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              eventDetails, (route) => false,);
                          },
                          // You can display more parameters in the ListTile
                        );
                      },
                    );
                  },
                ),
              ]
          ),
        ),

      ),
    );
  }
}

class EventHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Events".text.xl5.bold.make(),
          8.heightBox,
          "Events happening".text.xl.make(),
          20.heightBox,
        ]
    );
  }
}
