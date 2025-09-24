import 'package:flutter/material.dart';

class TermsCheckbox extends StatefulWidget {
  const TermsCheckbox({super.key});

  @override
  State<TermsCheckbox> createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 255,
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Үйлчилгээний нөхцөл',
                  style: TextStyle(color: Color(0xFF33547D), fontSize: 12),
                ),
                TextSpan(
                  text: ' болон ',
                  style: TextStyle(color: Color(0xFFA9B0BB), fontSize: 12),
                ),
                TextSpan(
                  text: 'Нууцлалын бодлогыг',
                  style: TextStyle(color: Color(0xFF33547D), fontSize: 12),
                ),
                TextSpan(
                  text: ' зөвшөөрч байна',
                  style: TextStyle(color: Color(0xFFA9B0BB), fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return Color(0xFF33547D);
            }
            return Color(0xFFf4f6f8);
          }),
          checkColor: Colors.white,
          side: MaterialStateBorderSide.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide(color: Color(0xFF33547D), width: 1.5);
            }
            return BorderSide(color: Color(0xFFCAD0D7), width: 1.5);
          }),
        ),
      ],
    );
  }
}
