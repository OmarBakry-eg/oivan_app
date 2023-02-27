import 'package:flutter/material.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';

import 'sof_user_detail_list_tile_widget.dart';

class SofUserDetailsListWidget extends StatelessWidget {
  const SofUserDetailsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (c, i) => const SofUserDetailsListTileWidget(),
      itemCount: 16,
      separatorBuilder: (c, i) => const Divider(
        color: MyColors.whiteColor,
        height: 40,
        thickness: 1,
      ),
    );
  }
}
