import 'package:first_demo_project/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailed extends StatefulWidget {
  const UserDetailed({super.key, required this.user});
  final UserElement user;

  @override
  State<UserDetailed> createState() => _UserDetailedState();
}

class _UserDetailedState extends State<UserDetailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "User Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFFffedf3),
        foregroundColor: const Color(0xFF373757),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Image Avatar
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pinkAccent.withOpacity(0.2), width: 4),
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(widget.user.image),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Name
            Text(
              "${widget.user.firstName} ${widget.user.lastName}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF373757),
              ),
            ),
            const SizedBox(height: 4),
            // Location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "${widget.user.address.city}, ${widget.user.address.state}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Details Grid (2 per row)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildDetailItem("Email", widget.user.email, Icons.email_outlined),
                  _buildDetailItem("Phone", widget.user.phone, Icons.phone_outlined),
                  _buildDetailItem("Username", widget.user.username, Icons.person_outline),
                  _buildDetailItem("Age", widget.user.age.toString(), Icons.calendar_today_outlined),
                  _buildDetailItem("Gender", genderValues.reverse[widget.user.gender] ?? "", Icons.transgender_outlined),
                  _buildDetailItem("Birth Date", widget.user.birthDate, Icons.cake_outlined),
                  _buildDetailItem("Blood Group", widget.user.bloodGroup, Icons.bloodtype_outlined),
                  _buildDetailItem("Role", roleValues.reverse[widget.user.role] ?? "", Icons.badge_outlined),
                  _buildDetailItem("University", widget.user.university, Icons.school_outlined),
                  _buildDetailItem("Company", widget.user.company.name, Icons.business_outlined),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.pinkAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF373757),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
