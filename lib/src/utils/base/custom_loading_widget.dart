

import 'package:flutter/material.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(MyColors.orangeColor),
        ),
      );
  }
}
