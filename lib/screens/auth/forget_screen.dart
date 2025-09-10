import 'package:audio_app_2/screens/auth/forget_steps/forget_first.dart';
import 'package:audio_app_2/screens/auth/forget_steps/forget_second.dart';
import 'package:audio_app_2/screens/auth/forget_steps/forget_third.dart';
import 'package:audio_app_2/screens/auth/widgets/next_screen.dart';
import 'package:audio_app_2/screens/auth/widgets/step_header.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});
  @override
  ForgetScreenState createState() => ForgetScreenState();
}

class ForgetScreenState extends State<ForgetScreen> {
  final PageController _pageController = PageController();
  final totalSteps = 3;
  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  // ValueNotifier ашиглана
  final ValueNotifier<int> currentStepNotifier = ValueNotifier<int>(1);

  @override
  void dispose() {
    currentStepNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f5f7),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
        child: Column(
          children: [
            // StepHeader-ийг ValueListenableBuilder-тэй холбож байна
            ValueListenableBuilder<int>(
              valueListenable: currentStepNotifier,
              builder: (context, currentStep, _) {
                return StepHeader(
                  currentStep: currentStep,
                  totalSteps: totalSteps,
                  onBackPressed: currentStep > 1
                      ? () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      : null,
                );
              },
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  currentStepNotifier.value = index + 1;
                },
                children: [
                  ForgetFirst(formKey: _formKeys[0]),
                  ForgetSecond(formKey: _formKeys[1]),
                  ForgetThird(formKey: _formKeys[2]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 35),
              child: ValueListenableBuilder<int>(
                valueListenable: currentStepNotifier,
                builder: (context, currentStep, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (currentStep > 1) {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          icon: Image.asset(
                            'assets/images/leftarrow.png',
                            width: 12,
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF33547D),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            final form =
                                _formKeys[currentStep - 1].currentState;
                            if (form != null && form.validate()) {
                              if (currentStep < totalSteps) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NextScreen(),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            currentStep == 1
                                ? 'Үргэлжлүүлэх'
                                : currentStep == 2
                                ? 'Баталгаажуулах'
                                : 'Үргэлжлүүлэх',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
