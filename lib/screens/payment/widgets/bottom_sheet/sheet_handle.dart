import 'package:flutter/material.dart';

class SheetHandle extends StatelessWidget {
  const SheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 19),
      child: SizedBox(
        width: 55,
        height: 4,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFCAD0D7),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
