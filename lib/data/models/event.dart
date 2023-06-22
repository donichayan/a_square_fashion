import 'package:cloud_firestore/cloud_firestore.dart';

class Events {
  final String name;
  final String venue;
  final String description;
  final DateTime date;
  final String url;
  late final String? referenceID;
  Events({
    required this.name,
    required this.venue,
    required this.date,
    required this.url,
    required this.description,
  });
  factory Events.fromJson(Map<String, dynamic> json) => _eventFromJson(json);
  Map<String, dynamic> toJson() => _eventToJson(this);
  factory Events.fromSnapshot(DocumentSnapshot snapshot) {
    final newEvent = Events.fromJson(snapshot.data() as Map<String, dynamic>);
    newEvent.referenceID = snapshot.reference.id;
    return newEvent;
  }
  @override
  String toString() => 'Events<$name>';
}

Events _eventFromJson(Map<String, dynamic> json) {
  return Events(
    name: json['name'] as String,
    venue: json['venue'] as String,
    date: (json['date'] as Timestamp).toDate(),
    url: json['url'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _eventToJson(Events instance) => <String, dynamic>{
      'name': instance.name,
      'venue': instance.venue,
      'date': instance.date,
      'url': instance.url,
      'description': instance.description,
    };
