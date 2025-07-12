import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/ui_helpers.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpaceMedium,
          Row(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
          const Text(
            'Your Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceSmall,
          const Text(
            'Manage your account settings',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          // Profile options
          _buildProfileOption(Icons.person, 'Edit Profile'),
          _buildProfileOption(Icons.notifications, 'Notifications'),
          _buildProfileOption(Icons.payment, 'Payment Methods'),
          _buildProfileOption(Icons.help, 'Help & Support'),
          _buildProfileOption(Icons.settings, 'Settings'),
          _buildProfileOption(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle option tap
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // tileColor: Colors.grey.shade50,
      ),
    );
  }
}
