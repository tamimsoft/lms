import 'package:get/get.dart';

class HelpController extends GetxController {
  final faqs = [
    {
      "question": "How do I borrow a book?",
      "answer":
      "To borrow a book, navigate to the book's detail page and click on the 'Borrow' button. You'll need to confirm the borrowing period and pickup location. Once confirmed, you can pick up your book at the library."
    },
    {
      "question": "What is the maximum borrowing period?",
      "answer":
      "Standard borrowing period is 14 days. You may renew your borrowed books up to two times if no other member has requested them."
    },
    {
      "question": "How do I return a book?",
      "answer":
      "Books can be returned at any of our library branches during opening hours. Simply hand them over at the circulation desk or use the self-service return kiosks."
    },
    {
      "question": "Are there late fees?",
      "answer":
      "Yes, late fees apply at a rate of \$0.25 per day per item, up to a maximum of the replacement cost of the item."
    },
    {
      "question": "How do I renew my books?",
      "answer":
      "You can renew books through your account on our website or mobile app. Go to 'Borrowings', select the items you wish to renew, and click 'Renew'."
    },
  ];

  final name = ''.obs;
  final email = ''.obs;
  final subject = ''.obs;
  final message = ''.obs;

  void submitForm() {
    Get.snackbar(
      'Message Sent',
      "We've received your message and will respond shortly.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
