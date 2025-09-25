import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBackPressed;
  final String text;

  const StepHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBackPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          // Progress bar
          Row(
            children: List.generate(totalSteps, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 4,
                  decoration: BoxDecoration(
                    color: index < currentStep
                        ? const Color(0xFF33547D)
                        : const Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }),
          ),
          // Step text
          Positioned.fill(
            top: 4,
            child: Row(
              children: List.generate(totalSteps, (index) {
                return Expanded(
                  child: Visibility(
                    visible: index + 1 == currentStep,
                    child: Container(
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF33547D),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 18,
                            height: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF33547D),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
