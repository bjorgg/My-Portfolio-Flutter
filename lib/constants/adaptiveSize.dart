import 'package:flutter/material.dart';

// Adaptive size class used on fonts and some vectors to
// adapte size according to screen size
class AdaptiveSize {
  const AdaptiveSize();

  getadaptiveSize(BuildContext context, dynamic value) {
    return (value / 1920) * MediaQuery.of(context).size.width;
  }
}
