import 'package:flutter/material.dart';

extension Updates on Widget {
  Row addElementsInRow(BuildContext context, List<Widget> elements,
      {bool makeItLast = false}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: makeItLast ? [...elements, this] : [this, ...elements]);
  }
}
