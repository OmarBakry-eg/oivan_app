import 'package:flutter/material.dart';
import 'package:oivan_app/src/utils/ui/extension.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';
import 'custom_base_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hideAddButton, centerTitle, automaticallyImplyLeading, showTabbar;
  final String? title;
  const CustomAppBar(
      {Key? key,
      this.centerTitle = false,
      this.hideAddButton = false,
      this.automaticallyImplyLeading = true,
      this.showTabbar = false,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: MyColors.blackColor,
      title: CustomBaseText(title: title),
      bottom: !showTabbar
          ? null
          : TabBar(
              indicatorColor: MyColors.whiteColor,
              tabs: [
                const Tab(
                  child: CustomBaseText(
                    title: 'All SOF Users',
                    fontSize: 13,
                  ),
                ),
                Tab(
                  child: const CustomBaseText(
                    title: 'SOF Users',
                    fontSize: 13,
                  ).addElementsInRow(context, const [
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.bookmark,
                      color: MyColors.orangeColor,
                    )
                  ]),
                ),
              ],
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
