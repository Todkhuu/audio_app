import 'package:flutter/foundation.dart';

class OverlayController {
  final ValueNotifier<bool> isVisible = ValueNotifier(false);

  void toggle() => isVisible.value = !isVisible.value;
}
