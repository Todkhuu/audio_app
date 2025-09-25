import 'package:audio_app_2/screens/auth/signup_steps/signup_fifth.dart';
import 'package:audio_app_2/screens/auth/signup_steps/signup_first.dart';
import 'package:audio_app_2/screens/auth/signup_steps/signup_fourth.dart';
import 'package:audio_app_2/screens/auth/signup_steps/signup_second.dart';
import 'package:audio_app_2/screens/auth/signup_steps/signup_third.dart';
import 'package:audio_app_2/screens/auth/widgets/step_header.dart';
import 'package:audio_app_2/screens/success_register/success_register_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController();
  final totalSteps = 5;
  final _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
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
                  text: 'Алхам',
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
                  SignupFirst(formKey: _formKeys[0]),
                  SignupSecond(formKey: _formKeys[1]),
                  SignupThird(formKey: _formKeys[2]),
                  SignupFourth(formKey: _formKeys[3]),
                  SignupFifth(formKey: _formKeys[4]),
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
                                    builder: (context) =>
                                        SuccessRegisterScreen(),
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
                                : currentStep == 3
                                ? 'Код оруулах'
                                : currentStep == 4
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
