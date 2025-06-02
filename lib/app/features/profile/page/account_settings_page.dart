import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/account_settings_controller.dart';

class AccountSettingsPage extends StatelessWidget {
  final controller = Get.put(AccountSettingsController());

   AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              _buildProfilePic(),
              SizedBox(height: 24),
              _buildTextField("First Name", controller.firstName),
              _buildTextField("Last Name", controller.lastName),
              _buildTextField("Email", controller.email, icon: Icons.email),
              _buildTextField("Phone", controller.phone, icon: Icons.phone),
              _buildPasswordField(),
              _buildNotificationSwitch("Due Date Reminders", controller.notifyDueDate,
                  "Receive notifications about due books"),
              _buildNotificationSwitch("New Book Arrivals", controller.notifyNewBooks,
                  "Get updates on new books added to the library"),
              _buildNotificationSwitch("Library Events", controller.notifyEvents,
                  "Receive information about library events"),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.offNamed('/profile'),
                      child: Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.submit,
                      child: Text('Save Changes'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildProfilePic() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage("https://ui.shadcn.com/avatars/01.png"),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Icon(Icons.camera_alt, size: 16),
              ),
            )
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text('Change profile picture'),
        )
      ],
    );
  }

  Widget _buildTextField(String label, RxString controller,
      {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(() => TextFormField(
        initialValue: controller.value,
        onChanged: (v) => controller.value = v,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(),
        ),
      )),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(() => TextFormField(
        initialValue: controller.password.value,
        onChanged: (v) => controller.password.value = v,
        obscureText: !controller.showPassword.value,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(controller.showPassword.value
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () =>
            controller.showPassword.value = !controller.showPassword.value,
          ),
          border: OutlineInputBorder(),
        ),
      )),
    );
  }

  Widget _buildNotificationSwitch(String title, RxBool value, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Obx(() => SwitchListTile(
        value: value.value,
        onChanged: (v) => value.value = v,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
      )),
    );
  }
}
