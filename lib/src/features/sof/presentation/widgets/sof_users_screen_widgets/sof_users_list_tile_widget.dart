import 'package:flutter/material.dart';
import 'package:oivan_app/src/utils/base/custom_base_text.dart';
import 'package:oivan_app/src/utils/ui/consts.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';
import 'package:oivan_app/src/utils/ui/routing/route_strings.dart';

class SOFUserListTileWidget extends StatelessWidget {
  
  const SOFUserListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=> Constants.navigateTo(RouteStrings.sofUserDetailsPageString,extra: 'USER ID'),
      leading: const CircleAvatar(
        backgroundColor: MyColors.purpleColor,
        radius: 25,
      ),
      title: const CustomBaseText(title: 'Omar Bakry'),
      isThreeLine: true,
      subtitle: CustomBaseText(
        title: 'Reputation : 1.1m\nReading, United Kingdom',
        color: Colors.grey[500],
        fontSize: 13,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_outline,
            size: 26,
            color: MyColors.orangeColor,
          )),
    );
  }
}
