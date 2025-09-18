import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Switchs extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;
  final String description;

  const Switchs({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 207,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledBodyText(label),
                const SizedBox(height: 5),
                StyledThinGreyText(description),
              ],
            ),
          ),
          const Spacer(),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF33547D),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Color(0xFFE3E7EA),
          ),
        ],
      ),
    );
  }
}
