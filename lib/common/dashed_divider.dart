import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Dash(
          direction: Axis.horizontal,
          length: constraints.maxWidth,
          dashLength: 4.5,
          dashThickness: 0.25,
          dashColor: const Color(0xFF33547D),
        );
      },
    );
  }
}
