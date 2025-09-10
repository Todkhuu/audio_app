import 'package:flutter/material.dart';

class StyledBodyText extends StatelessWidget {
  const StyledBodyText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 18.54 / 14,
        color: Color(0xFF33547D),
      ),
    );
  }
}

class StyledSmallBodyText extends StatelessWidget {
  const StyledSmallBodyText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFF33547D),
        height: 15 / 14,
      ),
    );
  }
}

class StyledSmallthinBodyText extends StatelessWidget {
  const StyledSmallthinBodyText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFF33547D),
      ),
    );
  }
}

class StyledGreyText extends StatelessWidget {
  const StyledGreyText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 18.54 / 14,
        color: Color(0xFFA9B0BB),
      ),
    );
  }
}

class StyledThinGreyText extends StatelessWidget {
  const StyledThinGreyText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 18.54 / 14,
        color: Color(0xFFA9B0BB),
      ),
    );
  }
}
