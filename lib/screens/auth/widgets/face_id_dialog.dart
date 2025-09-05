import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audio_app_2/managers/auth_manager.dart';

class FaceIDDialog {
  static void show({
    required BuildContext context,
    required AuthManager authManager,
  }) {
    if (authManager.dontShowAgain) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.only(top: 35, left: 20, right: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Face ID icon
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F6F8),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/auth/facebold.png',
                    width: 28.33,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Текст
              const SizedBox(
                width: 145,
                child: Text(
                  'Та Face ID ашиглан нэвтрэх үү?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF33547D),
                    height: 20 / 14,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Consumer<AuthManager>(
                    builder: (context, authManager, child) {
                      return Checkbox(
                        value: authManager.dontShowAgain,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            authManager.dontShowAgain = value;
                          }
                        },
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                          Set<MaterialState> states,
                        ) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xFF33547D);
                          }
                          return Colors.white;
                        }),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            color: states.contains(MaterialState.selected)
                                ? const Color(0xFF33547D)
                                : const Color(0xFFCAD0D7),
                            width: 1,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.67),
                        ),
                      );
                    },
                  ),
                  const Text(
                    'Дахиж харуулахгүй байх',
                    style: TextStyle(fontSize: 12, color: Color(0xFFA9B0BB)),
                  ),
                ],
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          actions: [
            Row(
              children: [
                // Буцах товч
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4F6F8),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Буцах",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFA9B0BB),
                        height: 20 / 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Асаах товч
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF33547D),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Асаах",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 20 / 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
