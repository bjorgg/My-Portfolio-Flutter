import 'package:flutter/material.dart';

class AdaptiveSize {
  const AdaptiveSize();

  getadaptiveSize(BuildContext context, dynamic value) {
    return (value / 1920) * MediaQuery.of(context).size.width;
  }
}
