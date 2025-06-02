import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryEvent {
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final int attendees;
  final int maxAttendees;
  final String type;
  bool registered;

  LibraryEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.attendees,
    required this.maxAttendees,
    required this.type,
    this.registered = false,
  });
}

class LibraryEventsController extends GetxController {
  var activeTab = 'upcoming'.obs;

  var events = <LibraryEvent>[
    LibraryEvent(
      id: '1',
      title: 'Book Club: Mystery Novels',
      description: 'Monthly discussion of mystery and thriller novels. This month: "Gone Girl" by Gillian Flynn.',
      date: '2024-02-15',
      time: '18:00',
      location: 'Reading Room A',
      attendees: 12,
      maxAttendees: 20,
      type: 'book-club',
    ),
    LibraryEvent(
      id: '2',
      title: 'Author Meet & Greet: Sarah Johnson',
      description: 'Meet bestselling author Sarah Johnson and get your books signed!',
      date: '2024-02-20',
      time: '15:00',
      location: 'Main Hall',
      attendees: 45,
      maxAttendees: 50,
      type: 'author-event',
      registered: true,
    ),
    LibraryEvent(
      id: '3',
      title: 'Creative Writing Workshop',
      description: 'Learn the basics of creative writing from published authors.',
      date: '2024-02-25',
      time: '10:00',
      location: 'Workshop Room',
      attendees: 8,
      maxAttendees: 15,
      type: 'workshop',
    ),
  ].obs;

  List<LibraryEvent> get filteredEvents =>
      activeTab.value == 'upcoming' ? events : events.where((e) => e.registered).toList();

  void registerEvent(String id) {
    final index = events.indexWhere((e) => e.id == id);
    if (index != -1 && !events[index].registered) {
      events[index].registered = true;
      events.refresh();
    }
  }

  String getTypeLabel(String type) {
    switch (type) {
      case 'book-club':
        return 'Book Club';
      case 'author-event':
        return 'Author Event';
      case 'workshop':
        return 'Workshop';
      default:
        return 'Event';
    }
  }

  Color getTypeColor(String type) {
    switch (type) {
      case 'book-club':
        return Colors.blue.shade100;
      case 'author-event':
        return Colors.purple.shade100;
      case 'workshop':
        return Colors.green.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  Color getTextColor(String type) {
    switch (type) {
      case 'book-club':
        return Colors.blue.shade800;
      case 'author-event':
        return Colors.purple.shade800;
      case 'workshop':
        return Colors.green.shade800;
      default:
        return Colors.grey.shade800;
    }
  }
}
