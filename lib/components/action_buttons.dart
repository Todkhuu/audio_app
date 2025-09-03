import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          _buildIconBox('assets/images/bm.png'),
          const SizedBox(width: 12),
          _buildIconBox('assets/images/like.png'),
          const SizedBox(width: 12),
          _buildIconBox('assets/images/download.png'),
          const SizedBox(width: 12),
          _buildIconBox('assets/images/bm2.png'),
        ],
      ),
    );
  }

  Widget _buildIconBox(String path) {
    return Container(
      width: 88,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(path, width: 26, height: 26),
      ),
    );
  }
}
