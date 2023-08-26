import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../constants/events.dart';
import '../constants/routes.dart';

class HomePageUniversity extends StatefulWidget {
  const HomePageUniversity({Key? key}) : super(key: key);

  @override
  State<HomePageUniversity> createState() => _HomePageUniversityState();
}

class _HomePageUniversityState extends State<HomePageUniversity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome!",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_3_outlined),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(profileRoute, (route) => false);
            },
          )
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(eventRegister);
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            EventHeader(),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('university')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(); // Loading indicator
                }

                List<Event> firestoreDataList = snapshot.data!.docs.map((doc) {
                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
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
                          eventDetails,
                          (route) => false,
                        );
                      },
                      // You can display more parameters in the ListTile
                    );
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class EventHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Events".text.xl5.bold.make(),
      8.heightBox,
      "Events happening".text.xl.make(),
      20.heightBox,
    ]);
  }
}
