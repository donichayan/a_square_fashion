import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserEvent {
  final String event;
  final String eventId;

  UserEvent({
    required this.event,
    required this.eventId,
  });
  factory UserEvent.fromJson(Map<String, dynamic> json) => _eventFromJson(json);
  Map<String, dynamic> toJson() => _eventToJson(this);
  @override
  String toString() => 'Event<$eventId>';
}

UserEvent _eventFromJson(Map<String, dynamic> json) {
  return UserEvent(
    event: json['event'] as String,
    eventId: json['event_id'] as String,
  );
}

Map<String, dynamic> _eventToJson(UserEvent instance) => <String, dynamic>{
      'event': instance.event,
      'event_id': instance.eventId,
    };

/* Event.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        eventId = json['event_id'];

  Map<String, dynamic> toJson() => {
        'event': event,
        'event_id': eventId,
      }; */
class UserFA {
  final String user;
  final String firstName;
  final String lastName;
  final List<UserEvent> events;

  UserFA({
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.events,
  });
  factory UserFA.fromJson(Map<String, dynamic> json) => _userFromJson(json);
  Map<String, dynamic> toJson() => _userToJson(this);
  factory UserFA.fromSnapshot(DocumentSnapshot snapshot) {
    final newUser = UserFA.fromJson(snapshot.data() as Map<String, dynamic>);

    return newUser;
  }
  @override
  String toString() => 'User<$firstName> User<$lastName>';
}

UserFA _userFromJson(Map<String, dynamic> json) {
  return UserFA(
      user: json['user'].trim(),
      firstName: json['first_name'].trim(),
      lastName: json['last_name'].trim(),
      events: _convertEevnts(json['events'] as List<dynamic>));
}

List<UserEvent> _convertEevnts(List<dynamic> eventMap) {
  final events = <UserEvent>[];

  for (final event in eventMap) {
    events.add(UserEvent.fromJson(event as Map<String, dynamic>));
  }
  return events;
}

Map<String, dynamic> _userToJson(UserFA instance) => <String, dynamic>{
      'user': instance.user,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'events': _eventList(instance.events),
    };
List<Map<String, dynamic>>? _eventList(List<UserEvent>? events) {
  if (events == null) {
    return null;
  }
  final eventMap = <Map<String, dynamic>>[];
  for (var event in events) {
    eventMap.add(event.toJson());
  }
  return eventMap;
}
