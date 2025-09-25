import 'package:audio_app_2/screens/start_step/widgets/option_tile.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class StartStepThird extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const StartStepThird({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        SizedBox(
          width: 300,
          child: StyledBodyText(
            'Та бясалгалыг ихэвчлэн хэзээ хийхийг хүсэж байна вэ?',
          ),
        ),
        const SizedBox(height: 40),
        OptionTile(text: 'Өглөө эрч хүч авахын тулд'),
        const SizedBox(height: 15),
        OptionTile(text: 'Өдөр ажлын завсарлагаар'),
        const SizedBox(height: 15),
        OptionTile(text: 'Орой тайвшрахын тулд'),
        const SizedBox(height: 15),
        OptionTile(text: 'Унтаж амрахын өмнө'),
        const SizedBox(height: 15),
        OptionTile(text: 'Боломжтой үедээ'),
        Form(key: formKey, child: SizedBox()),
      ],
    );
  }
}
