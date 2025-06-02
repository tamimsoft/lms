import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          child: Text(
            "JD",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "John Doe",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text("john.doe@example.com", style: TextStyle(color: Colors.grey)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            OutlinedButton(onPressed: () {}, child: Text("Edit Profile")),
            FilledButton(onPressed: () {
              Get.toNamed(RoutesName.userActivity);
            }, child: Text("View Activity")),
          ],
        ),
      ],
    );
  }
}

