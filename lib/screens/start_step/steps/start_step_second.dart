import 'package:audio_app_2/screens/start_step/widgets/option_tile.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class StartStepSecond extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const StartStepSecond({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        SizedBox(
          width: 300,
          child: StyledBodyText(
            'Та бясалгалаар юуг илүү хөгжүүлэхийг хүсэж байна вэ?',
          ),
        ),
        const SizedBox(height: 40),
        OptionTile(text: 'Анхаарлаа төвлөрүүлэх'),
        const SizedBox(height: 15),
        OptionTile(text: 'Өөрийгөө ойлгох'),
        const SizedBox(height: 15),
        OptionTile(text: 'Аз жаргалтай мэдрэмжийг нэмэх'),
        const SizedBox(height: 15),
        OptionTile(text: 'Уур бухимдлаа зохицуулах'),
        const SizedBox(height: 15),
        OptionTile(text: 'Өдрийн эрч хүчийг нэмэх'),
        Form(key: formKey, child: SizedBox()),
      ],
    );
  }
}
