import 'package:flutter/material.dart';

extension Updates on Widget {
  GestureDetector removeFocus(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: this,
    );
  }

  Row addElementsInRow(BuildContext context, List<Widget> elements,
      {bool makeItLast = false}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: makeItLast ? [...elements, this] : [this, ...elements]);
  }
}

extension Spaces on num {
  SizedBox get sH => SizedBox(height: toDouble());
  SizedBox get sW => SizedBox(width: toDouble());
}
