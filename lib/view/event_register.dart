import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusakha/constants/randomGenerate.dart';
import 'package:edusakha/constants/routes.dart';
import 'package:edusakha/view/universityHome.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> _submitEvent() async {
    final db = FirebaseFirestore.instance;
    // final response = await http.post(
    //   Uri.parse('http://localhost/php-hack/insert_event.php'),
    //
    //   body: {
    //     'event_date': dateController.text,
    //     'event_name': nameController.text,
    //     'event_time': timeController.text,
    //     'event_description': descriptionController.text,
    //   },
    // );
    //
    // if (response.statusCode == 200) {
    //   // Successfully added event
    //   // You can add a success message or navigate to another page
    // } else {
    //   // Handle error
    //   print('Error adding event');
    // }
    await db.collection('university').doc(getRandomGeneratedId()).
    set({'event_date': dateController.text,
      'event_name': nameController.text,
      'event_time': timeController.text,
      'event_description': descriptionController.text,});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Event'),
      backgroundColor:Theme.of(context).colorScheme.inversePrimary,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Event Date'),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            TextFormField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Event Time'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Event Description'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _submitEvent();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    homeRouteUni, (route) => false);
              },
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
