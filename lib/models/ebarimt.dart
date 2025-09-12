import 'package:flutter/material.dart';

enum EBarimtType { individual, organization }

class EBarimt {
  final String lessonId;
  final EBarimtType type;

  // Хувь хүн
  final String? receiptNumber;
  final DateTime? paidDate;
  final String? qrImage;

  // Байгууллага
  final String? registrationNumber;
  final String? organizationName;

  EBarimt.individual({
    required this.lessonId,
    required this.receiptNumber,
    required this.paidDate,
    required this.qrImage,
  }) : type = EBarimtType.individual,
       registrationNumber = null,
       organizationName = null;

  EBarimt.organization({
    required this.lessonId,
    required this.registrationNumber,
    required this.organizationName,
    required this.paidDate,
  }) : type = EBarimtType.organization,
       receiptNumber = null,
       qrImage = null;
}

final List<EBarimt> mockEBarimts = [
  EBarimt.individual(
    lessonId: '1',
    receiptNumber: "TRX 001",
    paidDate: DateTime.now().subtract(const Duration(days: 2)),
    qrImage: 'assets/images/ebarimt/qr.png',
  ),
  EBarimt.organization(
    lessonId: '2',
    paidDate: DateTime.now().subtract(const Duration(days: 5)),
    registrationNumber: '6677 266',
    organizationName: 'Спэйсхаб ХХК',
  ),
];

final ValueNotifier<List<EBarimt>> eBarimtsNotifier =
    ValueNotifier<List<EBarimt>>(mockEBarimts);
