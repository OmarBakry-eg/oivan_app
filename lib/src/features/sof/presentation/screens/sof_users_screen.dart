import 'package:flutter/material.dart';
import 'package:oivan_app/src/utils/base/custom_app_bar.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';
import '../widgets/sof_users_screen_widgets/sof_list_widget.dart';

class SOFUsersScreen extends StatelessWidget {
  const SOFUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          showTabbar: true,
        ),
        backgroundColor: MyColors.blackColor,
        body: TabBarView(
          children: [
            SOFUsersListWidget(),
            SOFUsersListWidget(),
          ],
        ),
      ),
    );
  }
}
