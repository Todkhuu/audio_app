import 'package:audio_app_2/managers/page_manager.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final description =
                  pageManager.currentLessonNotifier.value?.lessonDescription ??
                  'Тайлбар алга';
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(20),
                title: const Text(
                  'Хичээлийн тайлбар',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF33547D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('За'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: Image.asset(
          'assets/images/action_control/info.png',
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
