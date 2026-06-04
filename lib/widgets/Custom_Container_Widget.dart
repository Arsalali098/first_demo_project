import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String username;
  final String email;
  final String number;
  final String age;
  final String address;
  final String aim;

  const CustomContainerWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.username,
    required this.email,
    required this.number,
    required this.age,
    required this.address,
    required this.aim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 260,
      margin: const EdgeInsets.fromLTRB(0,15,0,0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: imagePath.startsWith('http')
                    ? Image.network(
                        imagePath,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imagePath,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                Text(
                  "@$username",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const Padding(padding: EdgeInsetsGeometry.all(8)),

                _buildInfoRow(Icons.email, email),
                _buildInfoRow(Icons.phone_iphone, number),
                _buildInfoRow(Icons.cake, "$age Years Old"),
                _buildInfoRow(Icons.location_on, address),

                const Text(
                  "MY AIM",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  aim,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF444444),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: Colors.blue.shade800),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF555555),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
