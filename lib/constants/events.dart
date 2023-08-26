import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventDescription;

  Event({
    required this.eventName,
    required this.eventDate,
    required this.eventDescription,
    required this.eventTime,
  });


  Map<String, dynamic> toFirestore() {
    return {
      "event_name": eventName,
      "event_date": eventDate,
      "event_description": eventDescription,
      "event_time": eventTime,
    };
  }
}