import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class DashedDividerCol extends StatelessWidget {
  final double? height;
  const DashedDividerCol({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashHeight = height ?? 0;
        return Dash(
          direction: Axis.vertical,
          length: dashHeight,
          dashLength: 4.5,
          dashThickness: 0.25,
          dashColor: const Color(0xFF33547D),
        );
      },
    );
  }
}
