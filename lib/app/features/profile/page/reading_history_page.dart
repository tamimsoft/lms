import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/reading_history_controller.dart';

class ReadingHistoryPage extends StatelessWidget {
  final controller = Get.put(ReadingHistoryController());

   ReadingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reading History"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildGoalCard(),
            SizedBox(height: 20),
            _buildStatsGrid(),
            SizedBox(height: 20),
            _buildRecentBooks(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reading Goal 2024',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(Icons.flag, color: Theme.of(Get.context!).primaryColor),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${controller.booksRead} books read'),
                Text('${controller.readingGoal} books goal'),
              ],
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: controller.progressPercent / 100,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(
                Theme.of(Get.context!).primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${controller.readingGoal - controller.booksRead} books to go!',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        _statCard(
          Icons.menu_book_outlined,
          controller.booksRead.toString(),
          'Books Read',
        ),
        _statCard(
          Icons.trending_up,
          controller.pagesRead.toString(),
          'Pages Read',
        ),
        _statCard(
          Icons.emoji_events_outlined,
          controller.currentStreak.toString(),
          'Day Streak',
        ),
        _statCard(
          Icons.calendar_today,
          '${controller.totalReadingTime}h',
          'Reading Time',
        ),
      ],
    );
  }

  Widget _statCard(IconData icon, String value, String label) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: Theme.of(Get.context!).primaryColor),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentBooks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Completed',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SizedBox(height: 12),
        ...controller.recentBooks.map(
          (book) => Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    height: 72,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage(book['coverUrl'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['title'] as String,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          book['author'] as String,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              book['completedDate'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '★ ${book['rating']}',
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
