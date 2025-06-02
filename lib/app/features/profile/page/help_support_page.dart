import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/help_controller.dart';

class HelpSupportPage extends StatelessWidget {
  final HelpController controller = Get.put(HelpController());

  HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FAQs
            Row(
              children: [
                Icon(Icons.help_outline, color: Theme.of(context).primaryColor),
                SizedBox(width: 8),
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 12),
            ...controller.faqs.map((faq) {
              return ExpansionTile(
                title: Text(
                  faq['question']!,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      faq['answer']!,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 24),

            // Contact Methods
            Row(
              children: [
                Icon(Icons.phone, color: Theme.of(context).primaryColor),
                SizedBox(width: 8),
                Text(
                  'Contact Methods',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _contactCard(
                  Icons.phone,
                  "Call Us",
                  "Speak directly with our support team",
                  "(555) 123-4567",
                  () => launchUrl("tel:5551234567"),
                ),
                _contactCard(
                  Icons.email,
                  "Email",
                  "Get support via email",
                  "support@bookworm.com",
                  () => launchUrl("mailto:support@bookworm.com"),
                ),
                _contactCard(
                  Icons.chat,
                  "Live Chat",
                  "Chat with a support representative",
                  "Available 9AM - 5PM",
                  () => Get.snackbar("Chat", "Chat opened"),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Contact Form
            Row(
              children: [
                Icon(
                  Icons.contact_support,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 8),
                Text(
                  'Send Us a Message',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 12),
            Form(
              child: Column(
                children: [
                  TextField(
                    onChanged: controller.name,
                    decoration: InputDecoration(labelText: 'Your Name'),
                  ),
                  TextField(
                    onChanged: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Your Email'),
                  ),
                  TextField(
                    onChanged: controller.subject,
                    decoration: InputDecoration(labelText: 'Subject'),
                  ),
                  TextField(
                    onChanged: controller.message,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'How can we help you?',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.submitForm,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(48),
                    ),
                    child: Text('Send Message'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactCard(
    IconData icon,
    String title,
    String desc,
    String contact,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Icon(icon),
              ),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                desc,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              Text(
                contact,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: onTap, child: Text("Contact")),
            ],
          ),
        ),
      ),
    );
  }

  void launchUrl(String url) {
    // Placeholder for url_launcher implementation
    print("Launching $url");
  }
}
