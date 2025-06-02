import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/library_events_controller.dart';

class LibraryEventsPage extends StatelessWidget {
  final controller = Get.put(LibraryEventsController());

   LibraryEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Events'),
        leading: BackButton(),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.calendar_today, size: 16),
            label: Text('Calendar'),
          ),
        ],
      ),
      body: Obx(() => Column(
        children: [
          _buildTabs(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: controller.filteredEvents.isNotEmpty
                  ? ListView.builder(
                itemCount: controller.filteredEvents.length,
                itemBuilder: (context, index) {
                  final event = controller.filteredEvents[index];
                  return _buildEventCard(event);
                },
              )
                  : _emptyState(),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _tabButton('upcoming', 'All Events (${controller.events.length})'),
        _tabButton('my-events',
            'My Events (${controller.events.where((e) => e.registered).length})'),
      ],
    );
  }

  Widget _tabButton(String tab, String label) {
    final isActive = controller.activeTab.value == tab;
    return Expanded(
      child: TextButton(
        onPressed: () => controller.activeTab.value = tab,
        style: TextButton.styleFrom(
          backgroundColor: isActive ? Colors.grey.shade100 : Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? Theme.of(Get.context!).primaryColor : Colors.grey,
            )),
      ),
    );
  }

  Widget _buildEventCard(LibraryEvent event) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Text(event.title, style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: controller.getTypeColor(event.type),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  controller.getTypeLabel(event.type),
                  style: TextStyle(
                    fontSize: 11,
                    color: controller.getTextColor(event.type),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 6),
            Text(event.description, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
            SizedBox(height: 12),
            Wrap(spacing: 12, runSpacing: 6, children: [
              _infoRow(Icons.calendar_today, event.date),
              _infoRow(Icons.access_time, event.time),
              _infoRow(Icons.location_on, event.location),
              _infoRow(Icons.people, '${event.attendees}/${event.maxAttendees}'),
            ]),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${event.maxAttendees - event.attendees} spots remaining',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                event.registered
                    ? Chip(label: Text('✓ Registered'), backgroundColor: Colors.green.shade100)
                    : ElevatedButton.icon(
                  onPressed: () => controller.registerEvent(event.id),
                  icon: Icon(Icons.add, size: 16),
                  label: Text('Register'),
                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(Get.context!).primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
      ],
    );
  }

  Widget _emptyState() {
    final label = controller.activeTab.value == 'upcoming' ? 'No upcoming events' : 'No registered events';
    final desc = controller.activeTab.value == 'upcoming'
        ? 'Check back later for new events!'
        : 'Browse all events to register for interesting activities.';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_busy, size: 48, color: Colors.grey[300]),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          SizedBox(height: 4),
          Text(desc, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
          if (controller.activeTab.value == 'my-events')
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                onPressed: () => controller.activeTab.value = 'upcoming',
                child: Text('Browse All Events'),
              ),
            )
        ],
      ),
    );
  }
}
