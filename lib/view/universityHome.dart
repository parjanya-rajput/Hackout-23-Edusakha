import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
        title: Text(
          "Welcome!",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_3_outlined),
            onPressed: (){},

          )
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,


      ),
      body: SafeArea(
        child: Container(

          padding: Vx.m32,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventHeader(),
                EventList(),
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
class EventList extends StatelessWidget {
  List<Event> events= [
    const Event(
      event: 'Maths webinar',
      eventdesc: 'Topic: Linear Algebra',
    ),
    const Event(
      event: 'sts webinar',
      eventdesc: 'Topic: Linear Algebra',
    ),
    const Event(
      event: 'Maths webinar',
      eventdesc: 'Topic: Linear Algebra',
    ),
    const Event(
      event: 'Maths webinar',
      eventdesc: 'Topic: Linear Algebra',
    ),
    const Event(
      event: 'Maths webinar',
      eventdesc: 'Topic: Linear Algebra',
    ),
    const Event(
      event: 'Maths webinar',
      eventdesc: 'Topic: Linear Algebra',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context,index)=> Card(
          child: ListTile(
            title: Text('Eventname $index'),
            subtitle: Text('Eventdesc $index'),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ));
  }
}

class Event{
  final String event;
  final String eventdesc;

  const Event({
    required this.event,
    required this.eventdesc,
  });
}
