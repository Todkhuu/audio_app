import 'package:audio_app_2/screens/start_step/widgets/option_tile.dart';
import 'package:audio_app_2/shared/styled_text.dart';
import 'package:flutter/material.dart';

class StartStepFirst extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const StartStepFirst({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        SizedBox(
          width: 204,
          child: StyledBodyText('Танд яг одоо юу тулгамдаж байна вэ?'),
        ),
        const SizedBox(height: 40),
        OptionTile(text: 'Нойр хүрэхгүй, нойргүйдэлтэй'),
        const SizedBox(height: 15),
        OptionTile(text: 'Сэтгэл тавгүй байгаа'),
        const SizedBox(height: 15),
        OptionTile(text: 'Сэтгэлийн түгшүүртэй'),
        const SizedBox(height: 15),
        OptionTile(text: 'Стресс их байгаа'),
        const SizedBox(height: 15),
        OptionTile(text: 'Биеийн өвдөлт их'),
        Form(key: formKey, child: SizedBox()),
      ],
    );
  }
}
