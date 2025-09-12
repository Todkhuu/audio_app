import 'package:audio_app_2/models/notification_item.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationBottomSheet extends StatelessWidget {
  final NotificationItem item;
  const NotificationBottomSheet({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 55,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFFE1E6EF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Color(0xFF33547D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          StyledBodyText(item.title),
          const SizedBox(height: 20),
          // Description
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF3F444D),
              height: 20 / 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          // Date
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.5, horizontal: 8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F6F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              item.formattedDate,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF33547D),
              ),
            ),
          ),
          const SizedBox(height: 27),
          // Conditional Buttons
          if (item.id == "1" && item.meetUrl != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFF4F6F8)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 8,
                    bottom: 8,
                    right: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledBodyText("Уулзалтын холбоос"),
                          const SizedBox(height: 3),
                          InkWell(
                            onTap: () async {
                              final uri = Uri.tryParse(item.meetUrl!);
                              if (uri != null && await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            child: Text(
                              item.meetUrl!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4A88DA),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: item.meetUrl!));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("URL copied")),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/notification/share.png',
                          width: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF33547D),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    final uri = Uri.tryParse(item.meetUrl!);
                    if (uri != null && await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  child: const Text(
                    "Уулзалт руу орох",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          if (item.id == "2")
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF33547D),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Хичээл үзэх",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
