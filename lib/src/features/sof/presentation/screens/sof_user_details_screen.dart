import 'package:flutter/material.dart';
import 'package:oivan_app/src/features/sof/presentation/widgets/sof_user_details_screen_widgets/sof_user_detail_list_widget.dart';
import 'package:oivan_app/src/utils/base/custom_app_bar.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';
import 'package:oivan_app/src/utils/ui/routing/routes.dart';
import 'package:route_detector/route_detector.dart';

class SOFUserDetailsScreen extends StatelessWidget {
  final String userID;
  const SOFUserDetailsScreen({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      appBar: const CustomAppBar(
        title: 'User Details',
      ),
      body: RouteDetector(
        routeObserver: AppRoutes.routeObserver,
        child: const SofUserDetailsListWidget(),
      ),
    );
  }
}
