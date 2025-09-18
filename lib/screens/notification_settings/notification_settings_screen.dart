import 'package:audio_app_2/common/screens_header.dart';
import 'package:audio_app_2/screens/notification_settings/widgets/switchs.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _receiveNotifications = false;
  bool _lessonReminder = false;
  bool _meeting = false;
  bool _news = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensHeader(text: 'Мэдэгдэл тохиргоо'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Switchs(
              label: 'Мэдэгдэл хүлээн авах',
              description: 'Бүх төрлийн мэдэгдлийг зэрэг авах тохиргоо',
              value: _receiveNotifications,
              onChanged: (val) {
                setState(() {
                  _receiveNotifications = val;
                });
              },
            ),
            const SizedBox(height: 15),
            Switchs(
              label: 'Хичээл сануулах',
              description: 'Хичээл эхлэхээс өмнө сануулга авах тохиргоо',
              value: _lessonReminder,
              onChanged: (val) {
                setState(() {
                  _lessonReminder = val;
                });
              },
            ),
            const SizedBox(height: 15),
            Switchs(
              label: 'Уулзалтын тов',
              description: 'Төлөвлөсөн уулзалтын сануулга авах тохиргоо',
              value: _meeting,
              onChanged: (val) {
                setState(() {
                  _meeting = val;
                });
              },
            ),
            const SizedBox(height: 15),
            Switchs(
              label: 'Зар мэдээ',
              description:
                  'Шинэ зар, мэдээллийн тухай мэдэгдэл хүлээн авах тохиргоо',
              value: _news,
              onChanged: (val) {
                setState(() {
                  _news = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
