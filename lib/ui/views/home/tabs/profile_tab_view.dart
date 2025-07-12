import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your Name", 
                        style: AppTextStyles.title1,
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Edit Profile",
                          style: AppTextStyles.body.eazyBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceMedium,
          _buildProfileOption(Icons.location_on, 'Shipping Address'),
          _buildProfileOption(Icons.wallet_membership_outlined, 'Memebership'),
          _buildProfileOption(Icons.favorite, 'Favorite'),
          _buildProfileOption(Icons.contact_phone, 'Contact Us'),
          _buildProfileOption(Icons.help, 'FAQ'),
            ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {},
            )
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
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
